require 'rails_helper'

module Spread
  RSpec.describe Export, :type => :model do
    
    describe '#initialize' do

      it "doesn't raise an error" do
        expect { Spread::Export.new }.not_to raise_error
      end

    end

  end
end
