require 'aric/job/base'

module Aric
  module Job
    class Player < Base
      def play_track(id = nil)
        run(:play_track, id)
      end
      alias_method :play, :play_track
      alias_method :start, :play_track

      def play_playlist(id)
        run(:play_playlist, id)
      end

      def pause
        run(:pause)
      end
      alias_method :stop, :pause

      def resume
        run(:resume)
      end

      def back_track
        run(:back_track)
      end
      alias_method :back, :back_track

      def previous_track
        run(:previous_track)
      end

      def next_track
        run(:next_track)
      end
      alias_method :next, :next_track

      def fast_forward
        run(:fast_forward)
      end

      def current_track
        t = run(:current_track)
        build_track(jsonify(t))
      end
      alias_method :track, :current_track

      def current_playlist
        pl = run(:current_playlist)
        build_playlist(jsonify(pl))
      end
      alias_method :playlist, :current_playlist

      def current_playlist_tracks
        ts = run(:current_playlist_tracks)
        build_tracks(jsonify(ts))
      end

      def player_state(v = [])
        run(:player_state)
      end
      alias_method :state, :player_state

      %w(playing paused stopped).each do |name|
        define_method("#{name}?") do
          player_state == name
        end
      end

      def player_position
        run(:player_position)
      end
      alias_method :position, :player_position

      def set_player_position(pos)
        run(:set_player_position, pos)
      end
      alias_method :set_position, :set_player_position
    end
  end
end
