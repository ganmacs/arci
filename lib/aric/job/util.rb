require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def activate
        run(:activate)
      end
      alias_method :open, :activate

      def love
        run(:love)
      end

      def unlove
        run(:unlove)
      end

      def playlist_love
        run(:playlist_love)
      end

      def playlist_unlove
        run(:playlist_unlove)
      end
    end
  end
end
