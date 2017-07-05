shared_examples_for 'it is instance formattable' do
  it { expect(described_class.new(address).format).to eq(format) }
end
