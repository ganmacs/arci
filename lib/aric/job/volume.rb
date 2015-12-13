require 'aric/job/base'

module Aric
  module Job
    class Volume < Base
      def up(v = 5)
        run(:up, v)
      end

      def down(v = 5)
        run(:down, v)
      end

      def mute
        run(:mute)
      end

      def unmute
        run(:unmute)
      end
    end
  end
end
