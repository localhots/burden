require 'rails/generators'
require 'rails/generators/migration'

module Burden
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

      def create_migration
        migration_template 'burden_runs_migration.rb', 'db/migrate/create_burden_runs.rb'
      end

      def create_initializer
        template 'burden_initializer.rb', 'config/initializers/burden.rb'
      end
    end
  end
end
