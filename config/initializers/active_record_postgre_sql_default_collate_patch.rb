# frozen_string_literal: true

module ActiveRecord
  module ConnectionAdapters
    module PostgreSQL
      module ColumnMethods
        def new_column_definition(name, type, **options)
          type = integer_like_primary_key_type(type, options) if integer_like_primary_key?(type, options)
          type = aliased_types(type.to_s, type)
          options[:primary_key] ||= type == :primary_key
          options[:null] = false if options[:primary_key]
          # set default collation for a column if not set explicitly
          if options[:collation].blank? && %i[string text].include?(type)
            options[:collation] = Rails.configuration.default_collation
          end
          create_column_definition(name, type, options)
        end
      end
    end
  end
end
