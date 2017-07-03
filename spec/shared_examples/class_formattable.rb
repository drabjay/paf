shared_examples_for 'is_class_formattable' do
  it { expect(described_class.format(address)).to eq(array) }
end
