require 'friendly_id'

module Spread
  class ReportTemplate < ActiveRecord::Base
    attr_accessible :instructions, :name, :report_conditions, :report_table_columns, 
                    :primary_model

    extend FriendlyId
    friendly_id :name, use: :slugged

    serialize :report_table_columns, Hash
    serialize :report_conditions, Hash    

  end
end