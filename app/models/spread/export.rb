module Spread
  class Export < ActiveRecord::Base
    # attr_accessible :title, :body
    attr_accessible :primary_model, :report_template

    belongs_to :report_template

    # def initialize
    # end

    def preview
      primary_model.joins(inner_joins).select(select).where(where_condition).limit(30).collect do |x|
        header.collect {|accessor| x[accessor] }
      end
    end

    def select

      # NOTE: Select example
      # http://stackoverflow.com/questions/23541010/ambiguous-column-names-and-activerecord-query-syntax#23544594
      #
      # Order.joins(:client).select([
      # Order.arel_table[:time].as('order_time'),
      #   Client.arel_table[:time].as('client_time')
      #   ])

      # TODO Need to make sure the primary model id is always included in the select

      hash = report_template.report_table_columns

      results = []
      hash.each do |key,value|
        model = Object.const_get(key.to_s.classify)
        value.select {|x,y| y == '1'}.keys.each do |column_name|
          results << model.arel_table[column_name.to_sym]
        end
      end
      return results
    end

    def where_condition
      active_conditions = report_template.report_conditions.values.select {|x| x[:active] == '1' }
      result = active_conditions.collect do |active_condition|
        accessor = active_condition[:accessor]
        comparison = 'gt' if active_condition[:comparison] == '>'
        comparison = 'lt' if active_condition[:comparison] == '<'
        comparison = 'eq' if active_condition[:comparison] == '='
        table = Object.const_get(active_condition[:table].classify).arel_table[accessor]

        value = active_condition[:value]
        value = start_time if value == 'start_date'
        value = end_time if value == 'end_date'

        table.send(comparison, value)
      end
      case result.length
        when 0
          return []
        when 1
          return result[0]
        when 2
          return result[0].and(result[1])
        when 3    
          return result[0].and(result[1]).and(result[2])
        end
      
    end    

    def primary_model
      Object.const_get(report_template.primary_model)
    end

    def table_name
      primary_model.table_name
    end

    def inner_joins
      report_template.report_table_columns.keys.collect(&:to_sym) - [table_name.singularize.to_sym]
    end    

  end
end
