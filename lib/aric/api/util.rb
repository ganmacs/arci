require 'aric/api/base'

module Aric
  module Api
    class Player < Base
      def activate(opt = {})
        run(:activate)
      end
      alias_method :open, :activate
    end
  end
end
