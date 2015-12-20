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
      when id?
        puts run.map(&:persistentID)
      else
        puts run
      end
    end

    private

    def run
      JobHandler.new(job).run(*values)
    end

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

    def id?
      options['id']
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
        opt.on('-i', '--id', 'show only id')
        # opt.on('-d', 'demonize')
      end
    end
  end
end
