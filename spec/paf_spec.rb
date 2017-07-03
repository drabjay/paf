require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Paf do
  it 'has a version number' do
    expect(Paf::VERSION).not_to be nil
  end

  let(:nursery_lane) do
    described_class.new(
      building_name: '1-2',
      thoroughfare_name: 'NURSERY',
      thoroughfare_descriptor: 'LANE',
      dependent_locality: 'PENN',
      post_town: 'HIGH WYCOMBE',
      postcode: 'HP10 8LS'
    )
  end

  it 'arrayifies empty address' do
    expect(described_class.to_a({})).to eq([])
  end

  it 'arrayifies address with PO Box' do
    expect(
      described_class.to_a(
        po_box_number: 61,
        post_town: 'FAREHAM',
        postcode: 'PO14 1UX'
      )
    ).to eq(
      [
        'PO BOX 61',
        'FAREHAM',
        'PO14 1UX'
      ]
    )
  end

  it 'arrayifies address with Exception Rule indicator i' do
    expect(
      described_class.to_a(
        building_name: '1-2',
        thoroughfare_name: 'NURSERY',
        thoroughfare_descriptor: 'LANE',
        dependent_locality: 'PENN',
        post_town: 'HIGH WYCOMBE',
        postcode: 'HP10 8LS'
      )
    ).to eq(
      [
        '1-2 NURSERY LANE',
        'PENN',
        'HIGH WYCOMBE',
        'HP10 8LS'
      ]
    )
  end

  it 'arrayifies address with Exception Rule indicator ii' do
    expect(
      described_class.to_a(
        building_name: '12A',
        thoroughfare_name: 'UPPERKIRKGATE',
        post_town: 'ABERDEEN',
        postcode: 'AB10 1BA'
      )
    ).to eq(
      [
        '12A UPPERKIRKGATE',
        'ABERDEEN',
        'AB10 1BA'
      ]
    )
  end

  it 'arrayifies address with Exception Rule indicator iii' do
    expect(
      described_class.to_a(
        building_name: 'K',
        thoroughfare_name: 'PORTLAND',
        thoroughfare_descriptor: 'ROAD',
        post_town: 'DORKING',
        postcode: 'RH4 1EW'
      )
    ).to eq(
      [
        'K PORTLAND ROAD',
        'DORKING',
        'RH4 1EW'
      ]
    )
  end

  it 'arrayifies address under Rule 1' do
    expect(
      described_class.to_a(
        organisation_name: 'LEDA ENGINEERING LTD',
        dependent_locality: 'APPLEFORD',
        post_town: 'ABINGDON',
        postcode: 'OX14 4PG'
      )
    ).to eq(
      [
        'LEDA ENGINEERING LTD',
        'APPLEFORD',
        'ABINGDON',
        'OX14 4PG'
      ]
    )
  end

  it 'arrayifies address under Rule 2' do
    expect(
      described_class.to_a(
        building_number: 1,
        thoroughfare_name: 'ACACIA',
        thoroughfare_descriptor: 'AVENUE',
        post_town: 'ABINGDON',
        postcode: 'OX14 4PG'
      )
    ).to eq(
      [
        '1 ACACIA AVENUE',
        'ABINGDON',
        'OX14 4PG'
      ]
    )
  end

  it 'arrayifies address under Rule 3 with building name exception' do
    expect(
      described_class.to_a(
        building_name: '1A',
        dependent_thoroughfare_name: 'SEASTONE',
        dependent_thoroughfare_descriptor: 'COURT',
        thoroughfare_name: 'STATION',
        thoroughfare_descriptor: 'ROAD',
        post_town: 'HOLT',
        postcode: 'NR25 7HG'
      )
    ).to eq(
      [
        '1A SEASTONE COURT',
        'STATION ROAD',
        'HOLT',
        'NR25 7HG'
      ]
    )
  end

  it 'arrayifies address under Rule 3 without building name exception' do
    expect(
      described_class.to_a(
        building_name: 'THE MANOR',
        thoroughfare_name: 'UPPER',
        thoroughfare_descriptor: 'HILL',
        post_town: 'HORLEY',
        postcode: 'RH6 0HP'
      )
    ).to eq(
      [
        'THE MANOR',
        'UPPER HILL',
        'HORLEY',
        'RH6 0HP'
      ]
    )
  end

  it 'arrayifies address under Rule 3 with split exception' do
    expect(
      described_class.to_a(
        organisation_name: 'S D ALCOTT FLORISTS',
        building_name: 'FLOWER HOUSE 189A',
        thoroughfare_name: 'PYE GREEN',
        thoroughfare_descriptor: 'ROAD',
        post_town: 'CANNOCK',
        postcode: 'WS11 5SB'
      )
    ).to eq(
      [
        'S D ALCOTT FLORISTS',
        'FLOWER HOUSE',
        '189A PYE GREEN ROAD',
        'CANNOCK',
        'WS11 5SB'
      ]
    )
  end

  it 'arrayifies address under Rule 3 without split exception' do
    expect(
      described_class.to_a(
        organisation_name: 'JAMES VILLA HOLIDAYS',
        building_name: 'CENTRE 30',
        thoroughfare_name: 'ST LAURENCE',
        thoroughfare_descriptor: 'AVENUE',
        post_town: 'GRAFTON',
        postcode: 'ME16 0LP'
      )
    ).to eq(
      [
        'JAMES VILLA HOLIDAYS',
        'CENTRE 30',
        'ST LAURENCE AVENUE',
        'GRAFTON',
        'ME16 0LP'
      ]
    )
  end

  it 'arrayifies address under Rule 4' do
    expect(
      described_class.to_a(
        building_name: 'VICTORIA HOUSE',
        building_number: 15,
        thoroughfare_name: 'THE',
        thoroughfare_descriptor: 'STREET',
        post_town: 'CHRISTCHURCH',
        postcode: 'BH23 6AA'
      )
    ).to eq(
      [
        'VICTORIA HOUSE',
        '15 THE STREET',
        'CHRISTCHURCH',
        'BH23 6AA'
      ]
    )
  end

  it 'arrayifies address under Rule 5' do
    expect(
      described_class.to_a(
        sub_building_name: 'FLAT 1',
        building_number: 12,
        thoroughfare_name: 'LIME TREE',
        thoroughfare_descriptor: 'AVENUE',
        post_town: 'BRISTOL',
        postcode: 'BS8 4AB'
      )
    ).to eq(
      [
        'FLAT 1',
        '12 LIME TREE AVENUE',
        'BRISTOL',
        'BS8 4AB'
      ]
    )
  end

  it 'arrayifies address under Rule 5 with concatenation indicator' do
    expect(
      described_class.to_a(
        sub_building_name: 'A',
        building_number: 12,
        thoroughfare_name: 'HIGH',
        thoroughfare_descriptor: 'STREET NORTH',
        dependent_locality: 'COOMBE BISSETT',
        post_town: 'SALISBURY',
        postcode: 'SP5 4NA',
        concatenation_indicator: 'Y'
      )
    ).to eq(
      [
        '12A HIGH STREET NORTH',
        'COOMBE BISSETT',
        'SALISBURY',
        'SP5 4NA'
      ]
    )
  end

  it 'arrayifies address under Rule 6 with sub-building name exception' do
    expect(
      described_class.to_a(
        sub_building_name: '10B',
        building_name: 'BARRY JACKSON TOWER',
        thoroughfare_name: 'ESTONE',
        thoroughfare_descriptor: 'WALK',
        post_town: 'BIRMINGHAM',
        postcode: 'B6 5BA'
      )
    ).to eq(
      [
        '10B BARRY JACKSON TOWER',
        'ESTONE WALK',
        'BIRMINGHAM',
        'B6 5BA'
      ]
    )
  end

  it 'arrayifies address under Rule 6 with building name exception' do
    expect(
      described_class.to_a(
        sub_building_name: 'CARETAKERS FLAT',
        building_name: '110-114',
        thoroughfare_name: 'HIGH',
        thoroughfare_descriptor: 'STREET WEST',
        post_town: 'BRISTOL',
        postcode: 'BS1 2AW'
      )
    ).to eq(
      [
        'CARETAKERS FLAT',
        '110-114 HIGH STREET WEST',
        'BRISTOL',
        'BS1 2AW'
      ]
    )
  end

  it 'arrayifies address under Rule 6 without exception' do
    expect(
      described_class.to_a(
        sub_building_name: 'STABLES FLAT',
        building_name: 'THE MANOR',
        thoroughfare_name: 'UPPER',
        thoroughfare_descriptor: 'HILL',
        post_town: 'HORLEY',
        postcode: 'RH6 0HP'
      )
    ).to eq(
      [
        'STABLES FLAT',
        'THE MANOR',
        'UPPER HILL',
        'HORLEY',
        'RH6 0HP'
      ]
    )
  end

  it 'arrayifies address under Rule 7 with sub-building name exception' do
    expect(
      described_class.to_a(
        sub_building_name: '2B',
        building_name: 'THE TOWER',
        building_number: 27,
        thoroughfare_name: 'JOHN',
        thoroughfare_descriptor: 'STREET',
        post_town: 'WINCHESTER',
        postcode: 'SO23 9AP'
      )
    ).to eq(
      [
        '2B THE TOWER',
        '27 JOHN STREET',
        'WINCHESTER',
        'SO23 9AP'
      ]
    )
  end

  it 'arrayifies address under Rule 7 without exception' do
    expect(
      described_class.to_a(
        sub_building_name: 'BASEMENT FLAT',
        building_name: 'VICTORIA HOUSE',
        building_number: 15,
        thoroughfare_name: 'THE',
        thoroughfare_descriptor: 'STREET',
        post_town: 'CORYTON',
        postcode: 'BP23 6AA'
      )
    ).to eq(
      [
        'BASEMENT FLAT',
        'VICTORIA HOUSE',
        '15 THE STREET',
        'CORYTON',
        'BP23 6AA'
      ]
    )
  end

  it 'arrayifies address from Mainfile' do
    expect(
      described_class.to_a(
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
      )
    ).to eq(
      [
        'SOUTH LANARKSHIRE COUNCIL',
        'HEAD START',
        'UNIT 1', 'BLOCK 3',
        'THIRD ROAD',
        'BLANTYRE INDUSTRIAL ESTATE',
        'BLANTYRE',
        'GLASGOW',
        'G72 0UP'
      ]
    )
  end

  it 'arrayifies Paf instance' do
    expect(
      nursery_lane.to_a
    ).to eq(
      [
        '1-2 NURSERY LANE',
        'PENN',
        'HIGH WYCOMBE',
        'HP10 8LS'
      ]
    )
  end

  it 'stringifies empty address' do
    expect(described_class.to_s({})).to eq('')
  end

  it 'stringifies address from Mainfile' do
    expect(
      described_class.to_s(
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
      )
    ).to eq(
      'SOUTH LANARKSHIRE COUNCIL, '\
      'HEAD START, '\
      'UNIT 1, '\
      'BLOCK 3, '\
      'THIRD ROAD, '\
      'BLANTYRE INDUSTRIAL ESTATE, '\
      'BLANTYRE, '\
      'GLASGOW. '\
      'G72 0UP'
    )
  end

  it 'stringifies Paf instance' do
    expect(
      nursery_lane.to_s
    ).to eq(
      '1-2 NURSERY LANE, PENN, HIGH WYCOMBE. HP10 8LS'
    )
  end

  it 'formats address' do
    expect(
      described_class.format(
        building_name: '1-2',
        thoroughfare_name: 'NURSERY',
        thoroughfare_descriptor: 'LANE',
        dependent_locality: 'PENN',
        post_town: 'HIGH WYCOMBE',
        postcode: 'HP10 8LS'
      )
    ).to eq(
      [
        '1-2 NURSERY LANE',
        'PENN',
        'HIGH WYCOMBE',
        'HP10 8LS'
      ]
    )
  end

  it 'formats Paf instance' do
    expect(
      nursery_lane.format
    ).to eq(
      [
        '1-2 NURSERY LANE',
        'PENN',
        'HIGH WYCOMBE',
        'HP10 8LS'
      ]
    )
  end
end
# rubocop:enable Metrics/BlockLength
