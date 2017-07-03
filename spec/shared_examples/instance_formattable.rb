shared_examples_for 'is_instance_formattable' do
  it { expect(described_class.new(address).format).to eq(array) }
end
