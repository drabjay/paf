require 'spec_helper'

RSpec.describe Paf do
  context 'with empty address' do
    let(:address) { {} }
    let(:array) { [] }
    let(:string) { '' }

    it_behaves_like 'is_fully_formattable'
  end
end
