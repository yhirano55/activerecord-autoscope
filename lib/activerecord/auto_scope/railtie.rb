# frozen_string_literal: true

module ActiveRecord
  module AutoScope
    class Railtie < ::Rails::Railtie # :nodoc:
      config.after_initialize do
        ActiveSupport.on_load :active_record do
          ActiveRecord::Base.extend ::ActiveRecord::AutoScope::ScopeMethods
        end

        if ::ActiveRecord::AutoScope.config.auto_define_scopes
          TracePoint.trace(:end) do |event|
            next if !event.self.ancestors.include?(ActiveRecord::Base) || event.self.abstract_class?

            event.self.enable_auto_scopes!
          end
        end
      end
    end
  end
end
