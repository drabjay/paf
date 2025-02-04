require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf::Address do
  context 'with default formatter' do
    let(:address) do
      {
        building_name: '1-2',
        thoroughfare_name: 'NURSERY',
        thoroughfare_descriptor: 'LANE',
        dependent_locality: 'PENN',
        post_town: 'HIGH WYCOMBE',
        postcode: 'HP10 8LS'
      }
    end
    let(:format) { ['1-2 NURSERY LANE', 'PENN', 'HIGH WYCOMBE', 'HP10 8LS'] }

    it_behaves_like 'it is class formattable'
    it_behaves_like 'it is instance formattable'
  end

  context 'with explicit formatter' do
    let(:address) do
      {
        building_name: '1-2',
        thoroughfare_name: 'NURSERY',
        thoroughfare_descriptor: 'LANE',
        dependent_locality: 'PENN',
        post_town: 'HIGH WYCOMBE',
        postcode: 'HP10 8LS',
        formatter: Paf::StringFormatter.new
      }
    end
    let(:format) { '1-2 NURSERY LANE, PENN, HIGH WYCOMBE. HP10 8LS' }

    it_behaves_like 'it is class formattable'
    it_behaves_like 'it is instance formattable'
  end
end
# rubocop:enable Metrics/BlockLength
