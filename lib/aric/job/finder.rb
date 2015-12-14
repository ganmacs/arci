require 'aric/job/base'

module Aric
  module Job
    class Finder < Base
      def find_track(v)
        t = run(:find_track, v)
        build_tracks(jsonify(t))
      end

      def find_track_by_id(id)
        t = run(:find_track_by_id, id)
        build_track(jsonify(t))
      end

      # Too Slow Command
      def find_all_tracks
        ts = run(:find_all_tracks)
        build_tracks(jsonify(ts))
      end

      %w(albums all artists composers displayed songs).each do |n|
        name = "find_track_by_#{n}"
        define_method(name) do |v|
          t = run('find_track_by', n, v)
          build_tracks(jsonify(t))
        end
      end

      def find_playlist(title)
        pl = run(:find_playlist, title)
        build_playlist(jsonify(pl))
      end

      def find_all_playlists
        ts = run(:find_all_playlists)
        build_tracks(jsonify(ts))
      end

      private

      def run(job_name, *opt)
        ScriptRunner.run("finder/#{job_name}", opt)
      end
    end
  end
end
