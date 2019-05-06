# frozen_string_literal: true

module ActiveRecord
  module AutoScope
    class Railtie < ::Rails::Railtie # :nodoc:
      config.after_initialize do
        ActiveSupport.on_load :active_record do
          ActiveRecord::Base.extend ::ActiveRecord::AutoScope::ScopeMethods
          ActiveRecord::Base.prepend ::ActiveRecord::AutoScope::HookMethods
        end
      end
    end
  end
end
