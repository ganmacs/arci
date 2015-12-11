require 'aric/job/player'
require 'aric/job/util'

module Aric
  class JobHander
    class JobNotFound < StandardError; end

    def run(job_name, opt = {})
      raise JobNotFound unless include?(job_name)
      find_by(job_name).new.send(job_name, opt)
    end

    # Return runnable job list
    def list
      jobs
    end

    def include?(job)
      jobs.include?(job)
    end

    private

    # Return Job class has job_name
    #
    # job_name [String]
    def find_by(job_name)
      job_classes.find do |e|
        e.public_instance_methods(false).include?(job_name)
      end
    end

    def jobs
      @jobs ||= job_classes.flat_map do |e|
        e.public_instance_methods(false)
      end
    end

    def job_classes
      @job_class ||= Job.constants.tap { |e| e.delete(:Base) }.map { |e| Job.const_get(e) }
    end
  end
end
