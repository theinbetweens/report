require 'rails_helper'

module Spread
  RSpec.describe ReportTemplate, :type => :model do
    #pending "add some examples to (or delete) #{__FILE__}"

    describe '#save' do

      context 'given there is a "Product" model' do

        before(:each) do
          Product.create(name: 'Asdaskd')
        end

        it "doesn't raise an error" do
          expect{
            ReportTemplate.new(name: 'Some Name')
          }.not_to raise_error
        end

      end

    end

  end

end
