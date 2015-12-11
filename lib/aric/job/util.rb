require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def activate(opt = {})
        run(:activate)
      end
      alias_method :open, :activate

      def up(opt = {})
        run(:up)
      end

      def down(opt = {})
        run(:down)
      end

      def mute(opt = {})
        run(:mute)
      end

      def unmute(opt = {})
        run(:unmute)
      end

      def player_state(opt = {})
        run(:player_state)
      end
      alias_method :state, :player_state

      def player_position(opt = {})
        run(:player_position)
      end
      alias_method :position, :player_position

      def set_player_position(opt = {})
        run(:set_player_position, opt[:values].first)
      end
    end
  end
end
