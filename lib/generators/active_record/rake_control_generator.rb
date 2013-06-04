require 'rails/generators'
require 'rails/generators/migration'

class RakeControlGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.dirname(__FILE__)
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.new.utc.strftime('%Y%m%d%H%M%S')
    else
      '%.3d' % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'create_rake_control_runs.rb', 'db/migrate/create_rake_control_runs.rb'
  end
end
