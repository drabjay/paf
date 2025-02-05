require 'spec_helper'

RSpec.describe Paf::Address do
  context 'with PO Box' do
    let(:address) do
      {
        po_box_number: 61,
        post_town: 'FAREHAM',
        postcode: 'PO14 1UX'
      }
    end
    let(:array) { ['PO BOX 61', 'FAREHAM', 'PO14 1UX'] }
    let(:hash) do
      { lines: ['PO BOX 61'], post_town: 'FAREHAM', postcode: 'PO14 1UX' }
    end
    let(:string) { 'PO BOX 61, FAREHAM. PO14 1UX' }

    it_behaves_like 'it is fully formattable'
  end
end
