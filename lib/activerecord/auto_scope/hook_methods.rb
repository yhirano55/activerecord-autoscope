# frozen_string_literal: true

module ActiveRecord
  module AutoScope
    module HookMethods # :nodoc:
      def self.prepended(child)
        child.extend ClassMethods
      end

      module ClassMethods # :nodoc:
        private

        def method_missing(method_name, *args, &block)
          if enable_auto_define_scopes?
            enable_auto_scopes!
            public_send(method_name, *args, &block)
          else
            super
          end
        end

        def respond_to_missing?(method_name, include_private = false)
          super
        end

        def enable_auto_define_scopes?
          ::ActiveRecord::AutoScope.config.auto_define_scopes && !abstract_class?
        end
      end
    end
  end
end
