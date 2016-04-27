class CreateSpreadReportTemplates < ActiveRecord::Migration
  def change
    create_table :spread_report_templates do |t|
      t.string :name
      t.text :instructions
      t.text :report_table_columns
      t.text :report_conditions

      t.timestamps
    end
  end
end
