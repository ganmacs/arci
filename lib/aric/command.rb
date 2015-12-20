require 'optparse'
require 'aric/job_handler'
require 'aric/error/job_name_required'
require 'aric/error/job_not_found'
require 'aric/error/script_execution_error'

module Aric
  class Command
    def initialize(args = ARGV)
      @args = args
    end

    def call
      case
      when list?
        puts job_list
      when play?
        play
      else
        puts run
      end
    rescue Aric::Error::JobNameRequired, Aric::Error::JobNotFound, Aric::Error::ScriptExecutionError => e
      puts "Error: #{e}"
    end

    private

    def values
      @args.drop(1)
    end

    def job
      @args.first or raise Aric::Error::JobNameRequired
    end

    def run
      JobHandler.new(job).run(*values)
    end

    def play
      JobHandler.play(*@args)
    end

    def job_list
      JobHandler.jobs
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
      end
    end
  end
end
