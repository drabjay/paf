require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf do
  context 'with Rule 6 with sub-building name exception' do
    let(:address) do
      {
        sub_building_name: '10B',
        building_name: 'BARRY JACKSON TOWER',
        thoroughfare_name: 'ESTONE',
        thoroughfare_descriptor: 'WALK',
        post_town: 'BIRMINGHAM',
        postcode: 'B6 5BA'
      }
    end
    let(:array) do
      [
        '10B BARRY JACKSON TOWER',
        'ESTONE WALK',
        'BIRMINGHAM',
        'B6 5BA'
      ]
    end
    let(:string) { '10B BARRY JACKSON TOWER, ESTONE WALK, BIRMINGHAM. B6 5BA' }

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 6 with building name exception' do
    let(:address) do
      {
        sub_building_name: 'CARETAKERS FLAT',
        building_name: '110-114',
        thoroughfare_name: 'HIGH',
        thoroughfare_descriptor: 'STREET WEST',
        post_town: 'BRISTOL',
        postcode: 'BS1 2AW'
      }
    end
    let(:array) do
      [
        'CARETAKERS FLAT',
        '110-114 HIGH STREET WEST',
        'BRISTOL',
        'BS1 2AW'
      ]
    end
    let(:string) do
      'CARETAKERS FLAT, 110-114 HIGH STREET WEST, BRISTOL. BS1 2AW'
    end

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 6 without exception' do
    let(:address) do
      {
        sub_building_name: 'STABLES FLAT',
        building_name: 'THE MANOR',
        thoroughfare_name: 'UPPER',
        thoroughfare_descriptor: 'HILL',
        post_town: 'HORLEY',
        postcode: 'RH6 0HP'
      }
    end
    let(:array) do
      [
        'STABLES FLAT',
        'THE MANOR',
        'UPPER HILL',
        'HORLEY',
        'RH6 0HP'
      ]
    end
    let(:string) { 'STABLES FLAT, THE MANOR, UPPER HILL, HORLEY. RH6 0HP' }

    it_behaves_like 'it is fully formattable'
  end
end
# rubocop:enable Metrics/BlockLength
