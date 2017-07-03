require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf do
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
    let(:string) { '2B THE TOWER, 27 JOHN STREET, WINCHESTER. SO23 9AP' }

    it_behaves_like 'is_fully_formattable'
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
    let(:string) do
      'BASEMENT FLAT, VICTORIA HOUSE, 15 THE STREET, CORYTON. BP23 6AA'
    end

    it_behaves_like 'is_fully_formattable'
  end
end
# rubocop:enable Metrics/BlockLength
