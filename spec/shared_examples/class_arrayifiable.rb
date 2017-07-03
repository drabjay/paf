shared_examples_for 'is_class_arrayifiable' do
  it { expect(described_class.to_a(address)).to eq(array) }
end
