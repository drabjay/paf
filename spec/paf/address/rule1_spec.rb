require 'spec_helper'

RSpec.describe Paf::Address do
  context 'with Rule 1' do
    let(:address) do
      {
        organisation_name: 'LEDA ENGINEERING LTD',
        dependent_locality: 'APPLEFORD',
        post_town: 'ABINGDON',
        postcode: 'OX14 4PG'
      }
    end
    let(:array) do
      ['LEDA ENGINEERING LTD', 'APPLEFORD', 'ABINGDON', 'OX14 4PG']
    end
    let(:hash) do
      {
        lines: ['LEDA ENGINEERING LTD', 'APPLEFORD'],
        post_town: 'ABINGDON',
        postcode: 'OX14 4PG'
      }
    end
    let(:string) { 'LEDA ENGINEERING LTD, APPLEFORD, ABINGDON. OX14 4PG' }

    it_behaves_like 'it is fully formattable'
  end
end
