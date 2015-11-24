require 'hashie'

module Aric
  module Resource
    class Base
      def initialize(resource)
        @resource = Hashie::Mash.new(resource)
      end

      def method_missing(method_name, *args, &block)
        if @track.respond_to?(method_name)
          @track.send(method_name, *args, &block)
        else
          super
        end
      end
    end
  end
end
