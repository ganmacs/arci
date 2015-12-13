require 'aric/job/base'

module Aric
  module Job
    class Finder < Base
      def find_track(v)
        t = run(:find_track, v)
        build_tracks(jsonify(t))
      end

      # Too Slow Command
      def find_all
        ts = run(:find_all)
        build_tracks(jsonify(ts))
      end

      def find_playlist(title)
        pl = run(:find_playlist, title)
        build_playlist(jsonify(pl))
      end

      %w(albums all artists composers displayed songs).each do |n|
        name = "find_track_by_#{n}"
        define_method(name) do |v|
          t = run('find_track_by', n, v)
          build_tracks(jsonify(t))
        end
      end

      private

      def run(job_name, *opt)
        ScriptRunner.run("finder/#{job_name}", opt)
      end
    end
  end
end
