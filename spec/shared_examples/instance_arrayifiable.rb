shared_examples_for 'it is instance arrayifiable' do
  it { expect(described_class.new(address).to_a).to eq(array) }
end
