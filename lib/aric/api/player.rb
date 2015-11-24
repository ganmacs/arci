require 'aric/api/base'

module Aric
  module Api
    class Player < Base
      def play(opt = {})
        run(:play)
      end

      def pause(opt = {})
        run(:pause)
      end

      def back_track(opt = {})
        run(:back_track)
      end

      def next_track(opt = {})
        run(:next_track)
      end
    end
  end
end
