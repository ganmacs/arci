require 'open3'
require 'aric/error/script_execution_error'

module Aric
  class ScriptRunner
    class << self
      def run(file_name, args = [])
        new(file_name).run(args)
      end
    end

    def initialize(file_name)
      @file_name = file_name.to_s
    end

    def run(args = [])
      @args = Array(args).join(' ')
      stdout, stderr, status = Open3.capture3(cmd)
      raise Aric::Error::ScriptExecutionError.new(stderr, cmd) unless status.success?
      stdout.strip
    end

    private

    def cmd
      @cmd ||= "osascript -l JavaScript #{script_file_path} #{@args}"
    end

    def script_file_path
      "#{script_base_dir}/#{@file_name}.js"
    end

    def script_base_dir
      @script_base_dir ||= File.expand_path('../../../scripts', __FILE__)
    end
  end
end
