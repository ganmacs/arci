require 'aric/api_handler'

module Aric
  class Command
    class JobNameRequired < StandardError; end

    def initialize(args = ARGV)
      @args = args
    end

    def call
      handler.run(job.to_sym)
    end

    private

    def job
      p @args.first or raise JobNameRequired
    end

    def handler
      @handler ||= ApiHander.new
    end
  end
end
