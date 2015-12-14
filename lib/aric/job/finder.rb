require 'aric/job/base'

module Aric
  module Job
    class Finder < Base
      def find_tracks(v)
        ts = run(:find_tracks, v)
        build_tracks(jsonify(ts))
      end

      def find_track_by_id(id)
        t = run(:find_track_by_id, id)
        build_track(jsonify(t))
      end

      def find_loved_tracks
        ts = run(:find_loved_tracks)
        build_tracks(jsonify(ts))
      end

      # Too Slow Command
      def find_all_tracks
        ts = run(:find_all_tracks)
        build_tracks(jsonify(ts))
      end

      %w(albums all artists composers displayed songs).each do |n|
        name = "find_tracks_by_#{n}"
        define_method(name) do |v|
          t = run('find_tracks_by', n, v)
          build_tracks(jsonify(t))
        end
      end

      def find_playlists(name)
        pls = run(:find_playlists, name)
        build_playlists(jsonify(pls))
      end

      def find_playlist_by_id(id)
        pl = run(:find_playlist_by_id, id)
        build_playlist(jsonify(pl))
      end

      def find_loved_playlists
        pls = run(:find_loved_playlists)
        build_playlists(jsonify(pls))
      end

      def find_all_playlists
        pls = run(:find_all_playlists)
        build_playlists(jsonify(pls))
      end

      private

      def run(job_name, *opt)
        ScriptRunner.run("finder/#{job_name}", opt)
      end
    end
  end
end
