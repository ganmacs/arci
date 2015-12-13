require 'aric/job/base'

module Aric
  module Job
    class Searcher < Base
      def find_track(v)
        t = run(:find_track, v)
        build_tracks(jsonify(t))
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
