# frozen_string_literal: true

module ActiveRecord
  module AutoScope
    module ScopeMethods # :nodoc:
      def enable_auto_scopes!
        columns.each do |column|
          attr_name = column.name
          table_name = column.table_name

          scope("#{attr_name}_eq", ->(value) { where(attr_name => value) })
          scope("#{attr_name}_not_eq", ->(value) { where.not(attr_name => value) })
          scope("#{attr_name}_is", ->(value) { where(attr_name => value) })
          scope("#{attr_name}_is_not", ->(value) { where.not(attr_name => value) })
          scope("#{attr_name}_null", -> { where(attr_name => nil) })
          scope("#{attr_name}_not_null", -> { where.not(attr_name => nil) })
          scope("#{attr_name}_present", -> { where("#{table_name}.#{attr_name} IS NOT NULL AND #{table_name}.#{attr_name} != ''") })
          scope("#{attr_name}_blank", -> { where("#{table_name}.#{attr_name} IS NULL OR #{table_name}.#{attr_name} = ''") })
          scope("#{attr_name}_asc", -> { order(attr_name => :asc) })
          scope("#{attr_name}_desc", -> { order(attr_name => :desc) })

          case column.type
          when :integer
            scope("#{attr_name}_gt", ->(value) { where("#{table_name}.#{attr_name} > ?", value) })
            scope("#{attr_name}_gteq", ->(value) { where("#{table_name}.#{attr_name} >= ?", value) })
            scope("#{attr_name}_lt", ->(value) { where("#{table_name}.#{attr_name} < ?", value) })
            scope("#{attr_name}_lteq", ->(value) { where("#{table_name}.#{attr_name} <= ?", value) })
          when :string, :text
            scope("#{attr_name}_start", ->(value) { where("#{table_name}.#{attr_name} LIKE ?", "#{sanitize_sql_like(value)}%") })
            scope("#{attr_name}_not_start", ->(value) { where("#{table_name}.#{attr_name} NOT LIKE ?", "#{sanitize_sql_like(value)}%") })
            scope("#{attr_name}_end", ->(value) { where("#{table_name}.#{attr_name} LIKE ?", "%#{sanitize_sql_like(value)}") })
            scope("#{attr_name}_not_end", ->(value) { where("#{table_name}.#{attr_name} NOT LIKE ?", "%#{sanitize_sql_like(value)}") })
            scope("#{attr_name}_cont", ->(value) { where("#{table_name}.#{attr_name} LIKE ?", "%#{sanitize_sql_like(value)}%") })
            scope("#{attr_name}_not_cont", ->(value) { where("#{table_name}.#{attr_name} NOT LIKE ?", "%#{sanitize_sql_like(value)}%") })
          when :date, :datetime
            scope("#{attr_name}_after", ->(value) { where("#{table_name}.#{attr_name} > ?", value) })
            scope("#{attr_name}_on_or_after", ->(value) { where("#{table_name}.#{attr_name} >= ?", value) })
            scope("#{attr_name}_before", ->(value) { where("#{table_name}.#{attr_name} < ?", value) })
            scope("#{attr_name}_on_or_before", ->(value) { where("#{table_name}.#{attr_name} <= ?", value) })
            scope("#{attr_name}_between", ->(_value) { where(attr_name => format_value) })
          when :boolean
            scope(attr_name, -> { where(attr_name => true) })
            scope("not_#{attr_name}", -> { where(attr_name => false) })
          end
        end
      end
    end
  end
end
