module Spread
  class ReportTemplate < ActiveRecord::Base
    attr_accessible :instructions, :name, :report_conditions, :report_table_columns

    extend FriendlyId
    friendly_id :name, use: :slugged

    before_validation :set_template_name
  end
end
