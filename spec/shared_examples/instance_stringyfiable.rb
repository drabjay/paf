shared_examples_for 'is_instance_stringyfiable' do
  it { expect(described_class.new(address).to_s).to eq(string) }
end
