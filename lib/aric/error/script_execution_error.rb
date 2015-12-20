module Aric
  module Error
    class ScriptExecutionError < StandardError
      def initialize(cmd, message)
        @cmd = cmd
        @message = message
      end

      def to_s
        "#{@message} in #{cmd}"
      end
    end
  end
end
