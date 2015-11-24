require 'json'
require 'aric/api/base'
require 'aric/resource/track'
require 'aric/resource/playlist'
require 'pp'

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

      def previous_track(opt = {})
        run(:previous_track)
      end

      def next_track(opt = {})
        run(:next_track)
      end

      def current_track(opt = {})
        track = run(:current_track)
        pp ::Aric::Resource::Track.new(JSON.parse(track))
        # p tack.name
      end

      def current_playlist(opt = {})
        playlist = run(:current_playlist)
        pp ::Aric::Resource::Playlist.new(JSON.parse(playlist))
      end

      def current_playlist_tracks(opt = {})
        playlist = run(:current_playlist_tracks)
        pp JSON.parse(playlist)
      end

      # def current_air_play_device(opt = {})
      #   track = run(:current_air_play_device)
      #   pp JSON.parse(track)
      # end

      def resume(opt = {})
        run(:resume)
      end

      def stop(opt = {})
        run(:resume)
      end
    end
  end
end
