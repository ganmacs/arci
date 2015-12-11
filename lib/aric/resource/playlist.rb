require 'aric/resource/base'

module Aric
  module Resource
    class Playlist < Base
      def to_s
        name
      end
    end
  end
end
