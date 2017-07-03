require 'spec_helper'

RSpec.describe Paf do
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
    let(:string) { '1 ACACIA AVENUE, ABINGDON. OX14 4PG' }

    it_behaves_like 'is_fully_formattable'
  end
end
