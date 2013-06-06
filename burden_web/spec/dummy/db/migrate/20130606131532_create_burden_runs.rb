class CreateBurdenRuns < ActiveRecord::Migration
  def up
    create_table :burden_runs do |t|
      t.string :name
      t.boolean :success
      t.float :execution_time
      t.timestamps
    end
  end

  def down
    drop_table :burden_runs
  end
end
