require 'aric/resource/base'

module Aric
  module Resource
    class Playlist < Base
      class << self
        private

        def find_with_condition(cond)
          case
          when cond[:name]
            finder.find_track_by_songs(cond[:name]).first
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
