require 'hashie'

module Aric
  module Resource
    class Base
      def initialize(resource)
        propeties = resource.delete('properties')
        @resource = Hashie::Mash.new(resource.merge(propeties))
      end

      def type
        @resource.class
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
