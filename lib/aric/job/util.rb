require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def activate
        run(:activate)
      end
      alias_method :open, :activate

      def player_position
        run(:player_position)
      end
      alias_method :position, :player_position

      def set_player_position(pos)
        run(:set_player_position, pos)
      end
    end
  end
end
