require 'spec_helper'

RSpec.describe Paf do
  context 'with Exception Rule indicator i' do
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
    let(:array) { ['1-2 NURSERY LANE', 'PENN', 'HIGH WYCOMBE', 'HP10 8LS'] }
    let(:string) { '1-2 NURSERY LANE, PENN, HIGH WYCOMBE. HP10 8LS' }

    it_behaves_like 'is_fully_formattable'
  end
end
