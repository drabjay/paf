require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf do
  context 'with Rule 3 with building name exception' do
    let(:address) do
      {
        building_name: '1A',
        dependent_thoroughfare_name: 'SEASTONE',
        dependent_thoroughfare_descriptor: 'COURT',
        thoroughfare_name: 'STATION',
        thoroughfare_descriptor: 'ROAD',
        post_town: 'HOLT',
        postcode: 'NR25 7HG'
      }
    end
    let(:array) { ['1A SEASTONE COURT', 'STATION ROAD', 'HOLT', 'NR25 7HG'] }
    let(:hash) do
      {
        lines: ['1A SEASTONE COURT', 'STATION ROAD'],
        post_town: 'HOLT',
        postcode: 'NR25 7HG'
      }
    end
    let(:string) { '1A SEASTONE COURT, STATION ROAD, HOLT. NR25 7HG' }

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 3 without building name exception' do
    let(:address) do
      {
        building_name: 'THE MANOR',
        thoroughfare_name: 'UPPER',
        thoroughfare_descriptor: 'HILL',
        post_town: 'HORLEY',
        postcode: 'RH6 0HP'
      }
    end
    let(:array) { ['THE MANOR', 'UPPER HILL', 'HORLEY', 'RH6 0HP'] }
    let(:hash) do
      {
        lines: ['THE MANOR', 'UPPER HILL'],
        post_town: 'HORLEY',
        postcode: 'RH6 0HP'
      }
    end
    let(:string) { 'THE MANOR, UPPER HILL, HORLEY. RH6 0HP' }

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 3 with split exception' do
    let(:address) do
      {
        organisation_name: 'S D ALCOTT FLORISTS',
        building_name: 'FLOWER HOUSE 189A',
        thoroughfare_name: 'PYE GREEN',
        thoroughfare_descriptor: 'ROAD',
        post_town: 'CANNOCK',
        postcode: 'WS11 5SB'
      }
    end
    let(:array) do
      [
        'S D ALCOTT FLORISTS',
        'FLOWER HOUSE',
        '189A PYE GREEN ROAD',
        'CANNOCK',
        'WS11 5SB'
      ]
    end
    let(:hash) do
      {
        lines: ['S D ALCOTT FLORISTS', 'FLOWER HOUSE', '189A PYE GREEN ROAD'],
        post_town: 'CANNOCK',
        postcode: 'WS11 5SB'
      }
    end
    let(:string) do
      'S D ALCOTT FLORISTS, '\
      'FLOWER HOUSE, '\
      '189A PYE GREEN ROAD, '\
      'CANNOCK. '\
      'WS11 5SB'
    end

    it_behaves_like 'it is fully formattable'
  end

  context 'with Rule 3 without split exception' do
    let(:address) do
      {
        organisation_name: 'JAMES VILLA HOLIDAYS',
        building_name: 'CENTRE 30',
        thoroughfare_name: 'ST LAURENCE',
        thoroughfare_descriptor: 'AVENUE',
        post_town: 'GRAFTON',
        postcode: 'ME16 0LP'
      }
    end
    let(:array) do
      [
        'JAMES VILLA HOLIDAYS',
        'CENTRE 30',
        'ST LAURENCE AVENUE',
        'GRAFTON',
        'ME16 0LP'
      ]
    end
    let(:hash) do
      {
        lines: ['JAMES VILLA HOLIDAYS', 'CENTRE 30', 'ST LAURENCE AVENUE'],
        post_town: 'GRAFTON',
        postcode: 'ME16 0LP'
      }
    end
    let(:string) do
      'JAMES VILLA HOLIDAYS, '\
      'CENTRE 30, '\
      'ST LAURENCE AVENUE, '\
      'GRAFTON. '\
      'ME16 0LP'
    end

    it_behaves_like 'it is fully formattable'
  end
end
# rubocop:enable Metrics/BlockLength
