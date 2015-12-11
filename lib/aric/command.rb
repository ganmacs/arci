require 'aric/job_handler'
require 'hashie'

module Aric
  class Command
    class JobNameRequired < StandardError; end

    def initialize(args = ARGV)
      @args = args
    end

    def call
      case job
      when '--list'
        puts handler.list
      else
        puts handler.run(job.to_sym, values: values)
      end
    end

    private

    def values
      @values ||= @args.drop(1)
    end

    def job
      @job ||= (@args.first or raise JobNameRequired)
    end

    def handler
      @handler ||= JobHander.new
    end
  end
end
