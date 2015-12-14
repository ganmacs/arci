require 'aric/resource/base'

module Aric
  module Resource
    class Track < Base
      class << self
        private

        def find_with_condition(cond)
          case
          when cond[:id]
            finder.find_track_by_id(cond[:id])
          when cond[:name]
            finder.find_track_by_songs(cond[:name]).first
          when cond[:album]
            finder.find_track_by_albums(cond[:album]).first
          when cond[:artists]
            finder.find_track_by_artists(cond[:artists]).first
          end
        end

        # Maybe Too Slow
        def find_all
          finder.find_all_tracks
        end
      end

      def play
        player.play(persistentID)
      end

      def to_s
        '%s / %s / %s' % [name, artist, album]
      end

      private

      def player
        @player ||= Aric::Job::Player.instance
      end
    end
  end
end
