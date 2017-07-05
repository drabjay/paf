shared_examples_for 'it is class hashifiable' do
  it { expect(described_class.to_h(address)).to eq(hash) }
end
