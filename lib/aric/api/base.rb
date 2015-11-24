require 'aric/script_runner'

module Aric
  module Api
    class Base
      private

      def run(job_name, opt = {})
        @job_name = job_name
        ScriptRunner.run(path_name)
      end

      def path_name
        @job_name.to_s
      end
    end
  end
end
