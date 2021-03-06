shared_examples_for 'it is fully formattable' do
  let(:format) { array }

  it_behaves_like 'it is class arrayifiable'
  it_behaves_like 'it is class hashifiable'
  it_behaves_like 'it is class stringyfiable'
  it_behaves_like 'it is class formattable'
  it_behaves_like 'it is instance arrayifiable'
  it_behaves_like 'it is instance hashifiable'
  it_behaves_like 'it is instance stringyfiable'
  it_behaves_like 'it is instance formattable'
end
