require 'rails/generators'
module MappingLanguage
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'generate base files'
      source_root File.expand_path('../../templates', __dir__)

      def create_migrations
        unless options[:skip_comments]
          migration_template 'migrations/create_lang_mappings.rb.erb', 'db/migrate/create_lang_mappings.rb'
        end
      end

      def create_model
        template 'models/lang_mapping.rb.erb', 'app/models/lang_mapping.rb'
      end
    end
  end
end