module Spread
  class ReportTemplate < ActiveRecord::Base
    attr_accessible :instructions, :name, :report_conditions, :report_table_columns
  end
end
