class CreateBurdenRuns < ActiveRecord::Migration
  def self.up
    create_table :burden_runs do |t|
      t.string :name
      t.boolean :success
      t.float :execution_time
      t.datetime :timestamp
    end
  end

  def self.down
    drop_table :burden_runs
  end
end
