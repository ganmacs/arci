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
    end
  end
end
