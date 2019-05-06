# frozen_string_literal: true

require 'active_record'

require_relative 'auto_scope/config'
require_relative 'auto_scope/hook_methods'
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
    def self.configure
      yield config
    end

    def self.config
      @config ||= Config.new
    end
  end
end
