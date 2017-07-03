require 'spec_helper'

RSpec.describe Paf do
  context 'with PO Box' do
    let(:address) do
      {
        po_box_number: 61,
        post_town: 'FAREHAM',
        postcode: 'PO14 1UX'
      }
    end
    let(:array) { ['PO BOX 61', 'FAREHAM', 'PO14 1UX'] }
    let(:string) { 'PO BOX 61, FAREHAM. PO14 1UX' }

    it_behaves_like 'is_fully_formattable'
  end
end
