shared_examples_for 'is_fully_formattable' do
  it_behaves_like 'is_class_arrayifiable'
  it_behaves_like 'is_class_stringyfiable'
  it_behaves_like 'is_class_formattable'
  it_behaves_like 'is_instance_arrayifiable'
  it_behaves_like 'is_instance_stringyfiable'
  it_behaves_like 'is_instance_formattable'
end
