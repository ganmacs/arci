module Aric
  module Error
    class JobNotFound < StandardError
      def initialize(job)
        @job = job
      end

      def to_s
        "Unkonw job specified `#{@job}`"
      end
    end
  end
end
