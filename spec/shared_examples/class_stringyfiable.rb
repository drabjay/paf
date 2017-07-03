shared_examples_for 'it is class stringyfiable' do
  it { expect(described_class.to_s(address)).to eq(string) }
end
