require 'aric/resource/base'
require 'aric/job/player'

module Aric
  module Resource
    class Track < Base
      class << self
        def find_by(cond)
          if codn.is_a?(Hash)
            f = Hash[*cond.first]
            f.key

            open("#{script_base_dir}/#{template_path}", 'r') do |f|
              f.each { |line| body << line }
            end

            args.each do |key, val|
              body.gsub!("#\{#{key}\}", val)
            end
          elsif cond == :all
          else
          end
        end

        def all
          find_by(:all)
        end
      end

      def play
        player.play(pesistendID)
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
