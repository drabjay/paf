shared_examples_for 'is_instance_arrayifiable' do
  it { expect(described_class.new(address).to_a).to eq(array) }
end
