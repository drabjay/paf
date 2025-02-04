require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf::Address do
  context 'with Exception Rule indicator iv with Unit' do
    let(:address) do
      {
        organisation_name: 'THE TAMBOURINE WAREHOUSE',
        building_name: 'UNIT 1-3',
        dependent_thoroughfare_name: 'INDUSTRIAL',
        dependent_thoroughfare_descriptor: 'ESTATE',
        thoroughfare_name: 'TAME',
        thoroughfare_descriptor: 'ROAD',
        post_town: 'LONDON',
        postcode: 'E6 7HS'
      }
    end
    let(:array) do
      [
        'THE TAMBOURINE WAREHOUSE',
        'UNIT 1-3',
        'INDUSTRIAL ESTATE',
        'TAME ROAD',
        'LONDON',
        'E6 7HS'
      ]
    end
    let(:hash) do
      {
        lines: [
          'THE TAMBOURINE WAREHOUSE',
          'UNIT 1-3',
          'INDUSTRIAL ESTATE',
          'TAME ROAD'
        ],
        post_town: 'LONDON',
        postcode: 'E6 7HS'
      }
    end
    let(:string) do
      'THE TAMBOURINE WAREHOUSE, UNIT 1-3, INDUSTRIAL ESTATE, TAME ROAD, LONDON. E6 7HS'
    end

    it_behaves_like 'it is fully formattable'
  end

  context 'with Exception Rule indicator iv with Stall' do
    let(:address) do
      {
        organisation_name: 'QUIRKY CANDLES LTD',
        building_name: 'STALL 4',
        thoroughfare_name: 'MARKET',
        thoroughfare_descriptor: 'SQUARE',
        post_town: 'LIVERPOOL',
        postcode: 'L8 1LH'
      }
    end
    let(:array) do
      [
        'QUIRKY CANDLES LTD',
        'STALL 4',
        'MARKET SQUARE',
        'LIVERPOOL',
        'L8 1LH'
      ]
    end
    let(:hash) do
      {
        lines: [
          'QUIRKY CANDLES LTD',
          'STALL 4',
          'MARKET SQUARE'
        ],
        post_town: 'LIVERPOOL',
        postcode: 'L8 1LH'
      }
    end
    let(:string) do
      'QUIRKY CANDLES LTD, STALL 4, MARKET SQUARE, LIVERPOOL. L8 1LH'
    end

    it_behaves_like 'it is fully formattable'
  end

  context 'with Exception Rule indicator iv with Rear Of' do
    let(:address) do
      {
        organisation_name: 'FIONA\'S FLOWERS',
        building_name: 'REAR OF 5A',
        thoroughfare_name: 'HIGH',
        thoroughfare_descriptor: 'STREET',
        post_town: 'GATESHEAD',
        postcode: 'NE8 1BH'
      }
    end
    let(:array) do
      [
        'FIONA\'S FLOWERS',
        'REAR OF 5A',
        'HIGH STREET',
        'GATESHEAD',
        'NE8 1BH'
      ]
    end
    let(:hash) do
      {
        lines: [
          'FIONA\'S FLOWERS',
          'REAR OF 5A',
          'HIGH STREET'
        ],
        post_town: 'GATESHEAD',
        postcode: 'NE8 1BH'
      }
    end
    let(:string) do
      'FIONA\'S FLOWERS, REAR OF 5A, HIGH STREET, GATESHEAD. NE8 1BH'
    end

    it_behaves_like 'it is fully formattable'
  end
end
# rubocop:enable Metrics/BlockLength
