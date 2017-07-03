shared_examples_for 'it is instance stringyfiable' do
  it { expect(described_class.new(address).to_s).to eq(string) }
end
