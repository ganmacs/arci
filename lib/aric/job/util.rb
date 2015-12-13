require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def activate
        run(:activate)
      end
      alias_method :open, :activate
    end
  end
end
