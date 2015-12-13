require 'optparse'
require 'aric/job_handler'

module Aric
  class Command
    class JobNameRequired < StandardError; end

    def initialize(args = ARGV)
      @args = args
    end

    def call
      case
      when list?
        puts JobHandler.jobs
      else
        puts handler.run(*values)
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
      @handler ||= JobHandler.new(job)
    end

    def list?
      options['list']
    end

    def options
      @options ||= option_parser.getopts(@argv)
    end

    def option_parser
      @optin_parser ||= OptionParser.new do |opt|
        opt.version = Aric::VERSION
        opt.banner = 'Usage: aric [options]'

        opt.separator 'Options:'
        opt.on('-l', '--list', 'show available methods')
        opt.on('-d', 'demonize')
      end
    end
  end
end
