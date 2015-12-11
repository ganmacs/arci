require 'hashie'

module Aric
  module Resource
    class Base
      def initialize(resource)
        propeties = resource.delete('properties')
        @resource = Hashie::Mash.new(resource.merge(propeties))

        @resource.select { |_, v| [TrueClass, FalseClass].include?(v) }.each do |k, v|
          class_eval do
            define_method("#{k}?") { v }
          end
        end
      end

      def type
        @resource.class
      end

      def method_missing(method_name, *args, &block)
        if @resource.respond_to?(method_name)
          @resource.send(method_name, *args, &block)
        else
          super
        end
      end
    end
  end
end
