require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module MappingLanguage
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __dir__)

      desc 'Generate Required files'

      def create_migrations
        unless check_table_exists?('lang_mappings')
          migration_template 'migrations/create_lang_mappings.rb.erb', 'db/migrate/create_lang_mappings.rb'
        end

        unless table_and_field_exists?('users', 'language')
          migration_template 'migrations/add_column_language_to_user.rb.erb', 'db/migrate/add_column_language_to_user.rb'
        end
      end

      def create_model
        template 'models/lang_mapping.rb.erb', 'app/models/lang_mapping.rb'
      end

      def create_config
        template 'config/extensions.rb', 'config/initializers/extensions.rb'
      end

      private
      def check_table_exists?(table_name)
        ActiveRecord::Base.connection.tables.include?(table_name)
      end

      def table_and_field_exists?(table_name, field)
        if ActiveRecord::Base.connection.tables.include?(table_name)
          table_name.camelize.singularize.constantize.column_names.include?(field)
        end
      end
    end
  end
end