require 'aric/resource/base'

module Aric
  module Resource
    class Playlist < Base
      class << self
        private

        def find_with_condition(cond)
          case
          when cond[:id]
            finder.find_playlist_by_id(cond[:id]).first
          when cond[:name]
            finder.find_playlists(cond[:name]).first
          when cond[:loved]
            finder.find_loved_playlists(cond[:loved])
          end
        end

        def find_all
          finder.find_all_playlists
        end
      end

      def to_s
        name
      end
    end
  end
end
