# frozen_string_literal: true

module ActiveRecord
  module AutoScope
    class Railtie < ::Rails::Railtie # :nodoc:
      config.before_initialize do
        ActiveSupport.on_load :active_record do
          ActiveRecord::Base.extend ::ActiveRecord::AutoScope::ScopeMethods
        end
      end

      config.to_prepare do
        ::ActiveRecord::AutoScope.tracer.enable if ::ActiveRecord::AutoScope.config.auto_define_scopes
      end

      # TODO: Disable trace point on development and test
      config.after_initialize do
        ::ActiveRecord::AutoScope.tracer.disable if ::ActiveRecord::AutoScope.config.auto_define_scopes && ::Rails.application.config.eager_load
      end
    end
  end
end
