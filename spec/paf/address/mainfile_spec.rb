require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf::Address do
  context 'with Mainfile address' do
    let(:address) do
      {
        organisation_name: 'SOUTH LANARKSHIRE COUNCIL',
        department_name: 'HEAD START',
        sub_building_name: 'UNIT 1',
        building_name: 'BLOCK 3',
        thoroughfare_name: 'THIRD',
        thoroughfare_descriptor: 'ROAD',
        double_dependent_locality: 'BLANTYRE INDUSTRIAL ESTATE',
        dependent_locality: 'BLANTYRE',
        post_town: 'GLASGOW',
        postcode: 'G72 0UP'
      }
    end
    let(:array) do
      [
        'SOUTH LANARKSHIRE COUNCIL',
        'HEAD START',
        'UNIT 1',
        'BLOCK 3',
        'THIRD ROAD',
        'BLANTYRE INDUSTRIAL ESTATE',
        'BLANTYRE',
        'GLASGOW',
        'G72 0UP'
      ]
    end
    let(:hash) do
      {
        lines: [
          'SOUTH LANARKSHIRE COUNCIL',
          'HEAD START',
          'UNIT 1',
          'BLOCK 3',
          'THIRD ROAD',
          'BLANTYRE INDUSTRIAL ESTATE',
          'BLANTYRE'
        ],
        post_town: 'GLASGOW',
        postcode: 'G72 0UP'
      }
    end
    let(:string) do
      'SOUTH LANARKSHIRE COUNCIL, '\
      'HEAD START, '\
      'UNIT 1, '\
      'BLOCK 3, '\
      'THIRD ROAD, '\
      'BLANTYRE INDUSTRIAL ESTATE, '\
      'BLANTYRE, '\
      'GLASGOW. '\
      'G72 0UP'
    end

    it_behaves_like 'it is fully formattable'
  end
end
# rubocop:enable Metrics/BlockLength
