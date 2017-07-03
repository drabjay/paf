require 'spec_helper'

RSpec.describe Paf do
  context 'with Rule 4' do
    let(:address) do
      {
        building_name: 'VICTORIA HOUSE',
        building_number: 15,
        thoroughfare_name: 'THE',
        thoroughfare_descriptor: 'STREET',
        post_town: 'CHRISTCHURCH',
        postcode: 'BH23 6AA'
      }
    end
    let(:array) do
      [
        'VICTORIA HOUSE',
        '15 THE STREET',
        'CHRISTCHURCH',
        'BH23 6AA'
      ]
    end
    let(:string) { 'VICTORIA HOUSE, 15 THE STREET, CHRISTCHURCH. BH23 6AA' }

    it_behaves_like 'it is fully formattable'
  end
end
