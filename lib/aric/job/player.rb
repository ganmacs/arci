require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def play(opt = {})
        run(:play)
      end

      def pause(opt = {})
        run(:pause)
      end

      def resume(opt = {})
        run(:resume)
      end

      def stop(opt = {})
        run(:resume)
      end

      def back_track(opt = {})
        run(:back_track)
      end

      def previous_track(opt = {})
        run(:previous_track)
      end

      def next_track(opt = {})
        run(:next_track)
      end

      def fast_forward(opt = {})
        run(:fast_forward)
      end

      def current_track(opt = {})
        t = run(:current_track)
        build_track(t)
      end

      def current_playlist(opt = {})
        pl = run(:current_playlist)
        build_playlist(pl)
      end

      def current_playlist_tracks(opt = {})
        ts = run(:current_playlist_tracks)
        ts.map { |t| build_track(t) }
      end

      def search(opt = {})
        t = run(:search)
        build_playlist(t)
      end
    end
  end
end
