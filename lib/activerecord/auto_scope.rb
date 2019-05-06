# frozen_string_literal: true

require 'active_record'

require_relative 'auto_scope/config'
require_relative 'auto_scope/scope_methods'
require_relative 'auto_scope/version'

begin
  require 'rails'
  require_relative 'auto_scope/railtie'
rescue LoadError
  nil
end

module ActiveRecord
  module AutoScope # :nodoc:
    def self.tracer
      @tracer ||= TracePoint.trace(:end) do |event|
        next unless event.self.respond_to?(:enable_auto_scopes!)

        event.self.enable_auto_scopes!
      end
    end

    def self.configure
      yield config
    end

    def self.config
      @config ||= Config.new
    end
  end
end
