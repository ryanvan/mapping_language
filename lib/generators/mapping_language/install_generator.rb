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
        unless migration_file_exists?('create_lang_mappings')
          migration_template 'migrations/create_lang_mappings.rb.erb', 'db/migrate/create_lang_mappings.rb'
        end

        unless migration_file_exists?('add_column_language_to_user')
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
      def migration_file_exists?(file_name)
        Dir.glob("#{File.join(destination_root, "db", "migrate")}/[0-9]*_*.rb").grep(/\d+_#{file_name}.rb/).first
      end
    end
  end
end