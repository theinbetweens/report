class CreateSpreadExports < ActiveRecord::Migration
  def change
    create_table :spread_exports do |t|

      t.timestamps
    end
  end
end
