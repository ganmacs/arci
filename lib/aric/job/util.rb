require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def activate(opt = {})
        run(:activate)
      end
      alias_method :open, :activate
    end
  end
end
