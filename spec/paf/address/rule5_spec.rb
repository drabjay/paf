require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf::Address do
  context 'with Rule 5' do
    let(:address) do
      {
        sub_building_name: 'FLAT 1',
        building_number: 12,
        thoroughfare_name: 'LIME TREE',
        thoroughfare_descriptor: 'AVENUE',
        post_town: 'BRISTOL',
        postcode: 'BS8 4AB'
      }
    end
    let(:array) { ['FLAT 1', '12 LIME TREE AVENUE', 'BRISTOL', 'BS8 4AB'] }
    let(:hash) do
      {
        lines: ['FLAT 1', '12 LIME TREE AVENUE'],
        post_town: 'BRISTOL',
        postcode: 'BS8 4AB'
      }
    end
    let(:string) { 'FLAT 1, 12 LIME TREE AVENUE, BRISTOL. BS8 4AB' }

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 5 with concatenation indicator' do
    let(:address) do
      {
        sub_building_name: 'A',
        building_number: 12,
        thoroughfare_name: 'HIGH',
        thoroughfare_descriptor: 'STREET NORTH',
        dependent_locality: 'COOMBE BISSETT',
        post_town: 'SALISBURY',
        postcode: 'SP5 4NA',
        concatenation_indicator: 'Y'
      }
    end
    let(:array) do
      [
        '12A HIGH STREET NORTH',
        'COOMBE BISSETT',
        'SALISBURY',
        'SP5 4NA'
      ]
    end
    let(:hash) do
      {
        lines: ['12A HIGH STREET NORTH', 'COOMBE BISSETT'],
        post_town: 'SALISBURY',
        postcode: 'SP5 4NA'
      }
    end
    let(:string) { '12A HIGH STREET NORTH, COOMBE BISSETT, SALISBURY. SP5 4NA' }

    it_behaves_like 'it is fully formattable'
  end
end
# rubocop:enable Metrics/BlockLength
