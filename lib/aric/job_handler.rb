require 'aric/job/player'
require 'aric/job/volume'
require 'aric/job/util'
require 'aric/job/finder'

module Aric
  class JobHander
    class JobNotFound < StandardError; end

    def initialize(job_name)
      @job_name = job_name.to_sym
    end

    def run(*args)
      # check argument number
      job_class.run(@job_name, *args)
    end

    # Return runnable job list
    def list
      jobs
    end

    private

    # Return Job class that has job_name method
    def job_class
      raise JobNotFound if job_not_found?
      job_class_hash.find { |_, v| v.include?(@job_name) }.first
    end

    def job_not_found?
      !jobs.include?(@job_name)
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
