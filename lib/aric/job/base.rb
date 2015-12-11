require 'json'
require 'aric/script_runner'
require 'aric/resource/track'
require 'aric/resource/playlist'

module Aric
  module Job
    class Base
      private

      def run(job_name, opt = {})
        ScriptRunner.run(job_name.to_s)
      end

      def build_playlist(payload)
        ::Aric::Resource::Playlist.new(JSON.parse(payload))
      end

      def build_track(payload)
        ::Aric::Resource::Track.new(JSON.parse(payload))
      end
    end
  end
end
