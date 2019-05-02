# frozen_string_literal: true

module ActiveRecord
  module AutoScope
    class Config # :nodoc:
      attr_accessor :auto_define_scopes

      def initialize
        @auto_define_scopes = true
      end
    end
  end
end
