require 'aric/job/player'
require 'aric/job/util'

module Aric
  class JobHander
    class JobNotFound < StandardError; end

    def run(job_name, opt = {})
      find_by(job_name).new.send(job_name, opt)
    end

    # Return runnable job list
    def list
      jobs
    end

    private

    # Return Job class that has job_name method
    #
    # job_name [String]
    def find_by(job_name)
      if include?(job_name)
        job_class_hash.find { |_, v| v.include?(job_name) }.first
      else
        raise JobNotFound
      end
    end

    def include?(job)
      jobs.include?(job)
    end

    def jobs
      @jobs ||= job_class_hash.values.flat_map(&:itself)
    end

    def job_class_hash
      @job_class_hash ||= job_classes.each_with_object({}) do |c, a|
        a[c] = c.public_instance_methods(false)
      end
    end

    def job_classes
      @job_class ||= Job.constants.tap { |e| e.delete(:Base) }.map { |e| Job.const_get(e) }
    end
  end
end
