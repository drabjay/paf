require 'spec_helper'

RSpec.describe Paf::Address do
  context 'with empty address' do
    let(:address) { {} }
    let(:array) { [] }
    let(:hash) { {} }
    let(:string) { '' }

    it_behaves_like 'it is fully formattable'
  end
end
