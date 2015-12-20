require 'aric/job'
require 'aric/error/job_name_required'
require 'aric/error/job_not_found'

module Aric
  class JobHandler
    class << self
      def play(*args)
        case
        when !args.first
          raise Aric::Error::JobNameRequired.new
        when !jobs.include?(args.first.to_sym)
          raise Aric::Error::JobNotFound.new(args.first)
        else
          new(:play_music).run(*args)
        end
      end

      # Avalable jobs names
      # @return [Array<Symbol>]
      def jobs
        @jobs ||= job_class_hash.values.flat_map(&:itself)
      end

      # Avalable jobs names and Class that them contain
      # @return [Hash<Class, Symbol>]
      def job_class_hash
        @job_class_hash ||= job_classes.each_with_object({}) do |c, a|
          a[c] = c.public_instance_methods(false)
        end
      end

      private

      # Classes that contain avalable jobs
      # @return [Job::Base] Job::Base extended class
      def job_classes
        @job_class ||= Job.constants.map { |e| Job.const_get(e) }
      end
    end

    def initialize(job_name)
      @job_name = job_name.to_sym
    end

    def run(*args)
      job_class.run(@job_name, *args)
    end

    private

    # Return Job class that has job_name method
    def job_class
      raise JobNotFound if job_not_found?
      JobHandler.job_class_hash.find { |_, v| v.include?(@job_name) }.first
    end

    def job_not_found?
      !JobHandler.jobs.include?(@job_name)
    end
  end
end
