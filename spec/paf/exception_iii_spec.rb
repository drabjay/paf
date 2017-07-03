require 'spec_helper'

RSpec.describe Paf do
  context 'with Exception Rule indicator iii' do
    let(:address) do
      {
        building_name: 'K',
        thoroughfare_name: 'PORTLAND',
        thoroughfare_descriptor: 'ROAD',
        post_town: 'DORKING',
        postcode: 'RH4 1EW'
      }
    end
    let(:array) { ['K PORTLAND ROAD', 'DORKING', 'RH4 1EW'] }
    let(:string) { 'K PORTLAND ROAD, DORKING. RH4 1EW' }

    it_behaves_like 'is_fully_formattable'
  end
end
