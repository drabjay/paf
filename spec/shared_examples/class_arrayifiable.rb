shared_examples_for 'it is class arrayifiable' do
  it { expect(described_class.to_a(address)).to eq(array) }
end
