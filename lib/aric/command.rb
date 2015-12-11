require 'aric/api_handler'
require 'hashie'

module Aric
  class Command
    class JobNameRequired < StandardError; end

    def initialize(args = ARGV)
      @args = args
    end

    def call
      case job
      when '--list' then handler.list
      else
        handler.run(job.to_sym)
      end
    end

    private

    def job
      @job ||= (@args.first or raise JobNameRequired)
    end

    def handler
      @handler ||= ApiHander.new
    end
  end
end
