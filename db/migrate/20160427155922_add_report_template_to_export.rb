class AddReportTemplateToExport < ActiveRecord::Migration
  def change
    add_column :spread_exports, :report_template_id, :integer
    add_index :spread_exports, :report_template_id
  end
end
