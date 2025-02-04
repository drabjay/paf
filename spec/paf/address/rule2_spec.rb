require 'spec_helper'

RSpec.describe Paf::Address do
  context 'with Rule 2' do
    let(:address) do
      {
        building_number: 1,
        thoroughfare_name: 'ACACIA',
        thoroughfare_descriptor: 'AVENUE',
        post_town: 'ABINGDON',
        postcode: 'OX14 4PG'
      }
    end
    let(:array) { ['1 ACACIA AVENUE', 'ABINGDON', 'OX14 4PG'] }
    let(:hash) do
      {
        lines: ['1 ACACIA AVENUE'],
        post_town: 'ABINGDON',
        postcode: 'OX14 4PG'
      }
    end
    let(:string) { '1 ACACIA AVENUE, ABINGDON. OX14 4PG' }

    it_behaves_like 'it is fully formattable'
  end
end
