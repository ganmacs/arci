require 'aric/api'

module Aric
  class ApiHander
    class JobNotFound < StandardError; end

    def run(job_name, opt = {})
      @job = job_name
      raise JobNotFound unless include?(job_name)
      api_class.new.send(job_name, opt)
    end

    def include?(job)
      api_methods.include?(job)
    end

    private

    def api_methods
      @api_methods ||= api_classes.flat_map do |e|
        e.public_instance_methods(false)
      end
    end

    def api_class
      api_classes.find do |e|
        e.public_instance_methods(false).include?(@job)
      end
    end

    def api_classes
      @api_class ||= Api.constants.tap { |e| e.delete(:Base) }.map { |e| Api.const_get(e) }
    end
  end
end
