shared_examples_for 'it is class formattable' do
  it { expect(described_class.format(address)).to eq(format) }
end
