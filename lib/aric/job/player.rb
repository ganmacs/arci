require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def play(opt = {})
        run(:play)
      end
      alias_method :start, :play

      def pause(opt = {})
        run(:pause)
      end
      alias_method :stop, :pause

      def resume(opt = {})
        run(:resume)
      end

      def back_track(opt = {})
        run(:back_track)
      end
      alias_method :back, :back_track

      def previous_track(opt = {})
        run(:previous_track)
      end

      def next_track(opt = {})
        run(:next_track)
      end
      alias_method :next, :next_track

      def fast_forward(opt = {})
        run(:fast_forward)
      end

      def current_track(opt = {})
        t = run(:current_track)
        build_track(t)
      end
      alias_method :track, :current_track

      def current_playlist(opt = {})
        pl = run(:current_playlist)
        build_playlist(pl)
      end
      alias_method :playlist, :current_playlist

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
