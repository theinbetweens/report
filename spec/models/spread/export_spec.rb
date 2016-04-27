require 'rails_helper'

module Spread
  RSpec.describe Export, :type => :model do
    
    describe '#initialize' do

      it "doesn't raise an error" do
        expect { Export.new }.not_to raise_error
      end

    end

    describe '#preview' do

      context 'there are 2 products' do

        let(:report_template) do
          ReportTemplate.create(
            name: 'Products Report',
            primary_model: "Product",
            #template: "dynamic",
            instructions: 'Lorem ipsum',
            report_table_columns: {
              'product' => {
                'name' => '1',
                'slug' => '1',
                'created_on' => '1'
              }
            },
            report_conditions: {
              'product_name' => { accessor: 'name', table: 'products', comparison: '', value: '', active: '0' },
              'product_slug' => { accessor: 'slug', table: 'products', comparison: '', value: '', active: '0' },
              'product_created_on' => { accessor: 'created_on', table: 'products', comparison: '>', value: 'start_date', active: '1' }
            }
          )
        end
        let(:subject) do 
          Export.create(report_template: report_template)
        end

        it 'returns 2 rows' do
          subject.preview.length.should == 2
        end

      end

    end

  end
end
