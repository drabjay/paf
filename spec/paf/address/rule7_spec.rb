require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf::Address do
  context 'with Rule 7 with a 0 building number' do
    let(:address) do
      {
        sub_building_name: 'FLAT 1',
        building_name: 'HOLLY HOUSE',
        building_number: 0,
        thoroughfare_name: 'OAK',
        thoroughfare_descriptor: 'AVENUE',
        dependent_locality: 'BIDDENDEN',
        post_town: 'ASHFORD',
        postcode: 'TN27 8BT'
      }
    end
    let(:array) { ['FLAT 1, HOLLY HOUSE', 'OAK AVENUE', 'BIDDENDEN', 'ASHFORD', 'TN27 8BT'] }
    let(:hash) do
      {
        lines: ['FLAT 1, HOLLY HOUSE', 'OAK AVENUE', 'BIDDENDEN'],
        post_town: 'ASHFORD',
        postcode: 'TN27 8BT'
      }
    end
    let(:string) { 'FLAT 1, HOLLY HOUSE, OAK AVENUE, BIDDENDEN, ASHFORD. TN27 8BT' }

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 7 with sub-building name exception' do
    let(:address) do
      {
        sub_building_name: '2B',
        building_name: 'THE TOWER',
        building_number: 27,
        thoroughfare_name: 'JOHN',
        thoroughfare_descriptor: 'STREET',
        post_town: 'WINCHESTER',
        postcode: 'SO23 9AP'
      }
    end
    let(:array) { ['2B THE TOWER', '27 JOHN STREET', 'WINCHESTER', 'SO23 9AP'] }
    let(:hash) do
      {
        lines: ['2B THE TOWER', '27 JOHN STREET'],
        post_town: 'WINCHESTER',
        postcode: 'SO23 9AP'
      }
    end
    let(:string) { '2B THE TOWER, 27 JOHN STREET, WINCHESTER. SO23 9AP' }

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 7 without exception' do
    let(:address) do
      {
        sub_building_name: 'BASEMENT FLAT',
        building_name: 'VICTORIA HOUSE',
        building_number: 15,
        thoroughfare_name: 'THE',
        thoroughfare_descriptor: 'STREET',
        post_town: 'CORYTON',
        postcode: 'BP23 6AA'
      }
    end
    let(:array) do
      [
        'BASEMENT FLAT',
        'VICTORIA HOUSE',
        '15 THE STREET',
        'CORYTON',
        'BP23 6AA'
      ]
    end
    let(:hash) do
      {
        lines: ['BASEMENT FLAT', 'VICTORIA HOUSE', '15 THE STREET'],
        post_town: 'CORYTON',
        postcode: 'BP23 6AA'
      }
    end
    let(:string) do
      'BASEMENT FLAT, VICTORIA HOUSE, 15 THE STREET, CORYTON. BP23 6AA'
    end

    it_behaves_like 'it is fully formattable'
  end
end
# rubocop:enable Metrics/BlockLength
