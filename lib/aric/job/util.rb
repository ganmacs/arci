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

      def love_playlist
        run(:love_playlist)
      end

      def playlist_unlove
        run(:unlove_playlist)
      end
    end
  end
end
