class CreateRakeControlRuns < ActiveRecord::Migration
  def self.up
    create_table :rake_control_runs do |t|
      t.string :name
      t.boolean :success
      t.float :execution_time
      t.timestamps
    end
  end

  def self.down
    drop_table :rake_control_runs
  end
end
