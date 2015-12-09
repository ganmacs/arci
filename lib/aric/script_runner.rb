require 'open3'

module Aric
  class ScriptRunner
    class << self
      def run(file_name, args = '')
        new(file_name).run(args)
      end
    end

    def initialize(file_name)
      @file_name = file_name
    end

    def run(args = '')
      stdio, stderr, status = Open3.capture3("osascript -l JavaScript #{script_file_path} #{args}")
      puts nil, '<============================================================ DEBUG OUTPUT START HERE'
      p stdio, stderr, status
      puts '<============================================================ DEBUG OUTPUT CLOSE HERE', nil
      raise stderr unless status.success?
      stdio
    end

    private

    def script_file_path
      "#{script_base_dir}/#{@file_name}.js"
    end

    def script_base_dir
      @script_base_dir ||= File.expand_path('../../../scripts', __FILE__)
    end
  end
end
