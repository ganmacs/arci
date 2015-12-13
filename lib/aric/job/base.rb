require 'json'
require 'aric/script_runner'
require 'aric/resource/track'
require 'aric/resource/playlist'

module Aric
  module Job
    class Base
      class << self
        def run(job_name, *args)
          new.send(job_name, *args)
        end
      end

      private

      def run(job_name, opt = {})
        ScriptRunner.run(job_name.to_s, opt)
      end

      def build_playlist(json)
        ::Aric::Resource::Playlist.new(json)
      end

      def build_track(json)
        ::Aric::Resource::Track.new(json)
      end

      def build_tracks(json)
        json.map do |e|
          build_track(e)
        end
      end

      private

      def jsonify(body)
        JSON.parse(body)
      end
    end
  end
end
