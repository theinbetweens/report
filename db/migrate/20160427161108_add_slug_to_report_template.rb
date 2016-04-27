class AddSlugToReportTemplate < ActiveRecord::Migration
  def change
    add_column :spread_report_templates, :slug, :string
  end
end
