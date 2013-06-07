require 'rails/generators'
require 'rails/generators/migration'

module Burden
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def create_migration
        migration_template 'create_burden_runs.rb', 'db/migrate/create_burden_runs.rb'
      end
    end
  end
end
