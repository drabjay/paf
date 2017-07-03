shared_examples_for 'is_class_stringyfiable' do
  it { expect(described_class.to_s(address)).to eq(string) }
end
