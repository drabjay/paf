shared_examples_for 'it is instance hashifiable' do
  it { expect(described_class.new(address).to_h).to eq(hash) }
end
