require 'spec_helper'

RSpec.describe Paf::Address do
  context 'with Exception Rule indicator ii' do
    let(:address) do
      {
        building_name: '12A',
        thoroughfare_name: 'UPPERKIRKGATE',
        post_town: 'ABERDEEN',
        postcode: 'AB10 1BA'
      }
    end
    let(:array) { ['12A UPPERKIRKGATE', 'ABERDEEN', 'AB10 1BA'] }
    let(:hash) do
      {
        lines: ['12A UPPERKIRKGATE'],
        post_town: 'ABERDEEN',
        postcode: 'AB10 1BA'
      }
    end
    let(:string) { '12A UPPERKIRKGATE, ABERDEEN. AB10 1BA' }

    it_behaves_like 'it is fully formattable'
  end
end
