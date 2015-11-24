require 'open3'

module Aric
  class ScriptRunner
    class << self
      def run(file_path)
        new(file_path).run
      end
    end

    def initialize(file_path)
      @file_path = file_path
    end

    def run
      o, e, s = Open3.capture3("osascript #{script_file_path}.js")
      p o, e, s
      raise e unless s.success?
      o
    end

    private

    def script_file_path
      "#{script_base_dir}/#{@file_path}"
    end

    def script_base_dir
      @script_base_dir ||= File.expand_path('../../../scripts', __FILE__)
    end
  end
end
