class AddPrimaryModelToTemplate < ActiveRecord::Migration
  def change
    add_column :spread_report_templates, :primary_model, :string
  end
end
