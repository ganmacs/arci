require 'hashie'
require 'aric/job'

module Aric
  module Resource
    class Base
      class << self
        def find_by(cond)
          raise ArgumentError if cond.nil?
          if cond.is_a?(Hash)
            find_with_condition(cond)
          elsif cond == :all
            find_all
          else
            raise ArgumentError
          end
        end

        def all
          find_by(:all)
        end

        private

        def find_all
          raise NotImplementedError
        end

        def find_with_condition(cond)
          raise NotImplementedError
        end

        def finder
          @finder ||= Aric::Job::Finder.instance
        end
      end

      def initialize(resource)
        properties = resource.delete('properties') || {}
        @resource = Hashie::Mash.new(resource.merge(properties))

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
