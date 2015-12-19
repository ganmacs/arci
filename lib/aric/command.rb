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
      when play?
        JobHandler.play(*@args)
      else
        puts JobHandler.new(job).run(*values)
      end
    end

    private

    def values
      @args.drop(1)
    end

    def job
      @args.first or raise JobNameRequired
    end

    def list?
      options['list']
    end

    def play?
      options['play']
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
        opt.on('-p', '--play', 'play found tracks')
        # opt.on('-d', 'demonize')
      end
    end
  end
end
