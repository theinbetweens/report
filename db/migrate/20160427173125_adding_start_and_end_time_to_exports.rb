class AddingStartAndEndTimeToExports < ActiveRecord::Migration
  def up
    add_column :spread_exports, :start_time, :time
    add_column :spread_exports, :end_time, :time
  end

  def down
    remove_column :spread_exports, :start_time
    remove_column :spread_exports, :end_time
  end
end
