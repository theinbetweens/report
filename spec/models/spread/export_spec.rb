require 'rails_helper'

module Spread
  RSpec.describe Export, :type => :model do
    
    describe '#initialize' do

      it "doesn't raise an error" do
        expect{
          Spree::Export.new
        }.should_not raise_error
      end

    end

  end
end
