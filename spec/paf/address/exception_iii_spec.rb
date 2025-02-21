require 'spec_helper'

RSpec.describe Paf::Address do
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
    let(:hash) do
      { lines: ['K PORTLAND ROAD'], post_town: 'DORKING', postcode: 'RH4 1EW' }
    end
    let(:string) { 'K PORTLAND ROAD, DORKING. RH4 1EW' }

    it_behaves_like 'it is fully formattable'
  end
end
