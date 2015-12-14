require 'hashie'

module Aric
  module Resource
    class Base
      def initialize(resource)
        properties = resource.delete('properties')
        @resource = if properties
                      Hashie::Mash.new(resource.merge(properties))
                    else
                      Hashie::Mash.new(resource)
                    end

        @resource.select { |_, v| [TrueClass, FalseClass].include?(v.class) }.each do |k, v|
          self.class.class_eval do
            define_method("#{k}?") { v }
          end
        end
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
