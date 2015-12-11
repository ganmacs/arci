require 'aric/job/player'
require 'aric/job/util'

module Aric
  class JobHander
    class JobNotFound < StandardError; end

    def run(job_name, opt = {})
      @job = job_name
      raise JobNotFound unless include?(job_name)
      job_class.new.send(job_name, opt)
    end

    # Print runnable job list
    def list
      puts jobs
    end

    def include?(job)
      jobs.include?(job)
    end

    private

    def jobs
      @jobs ||= job_classes.flat_map do |e|
        e.public_instance_methods(false)
      end
    end

    def job_class
      job_classes.find do |e|
        e.public_instance_methods(false).include?(@job)
      end
    end

    def job_classes
      @job_class ||= Job.constants.tap { |e| e.delete(:Base) }.map { |e| Job.const_get(e) }
    end
  end
end
