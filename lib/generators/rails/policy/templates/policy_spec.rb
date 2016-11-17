describe <%= class_name %>Policy do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:<%= file_name %>) { FactoryGirl.create(:<%= file_name %>) }

  shared_examples_for 'someone authorized' do
    it { is_expected.to allow_action(:index) }
    it { is_expected.to allow_action(:show) }
    it { is_expected.to allow_action(:new) }
    it { is_expected.to allow_action(:create) }
    it { is_expected.to allow_action(:edit) }
    it { is_expected.to allow_action(:update) }
    it { is_expected.to allow_action(:destroy) }
  end

  shared_examples_for 'someone not authorized' do
    it { is_expected.not_to allow_action(:index) }
    it { is_expected.not_to allow_action(:show) }
    it { is_expected.not_to allow_action(:new) }
    it { is_expected.not_to allow_action(:create) }
    it { is_expected.not_to allow_action(:edit) }
    it { is_expected.not_to allow_action(:update) }
    it { is_expected.not_to allow_action(:destroy) }
  end

  context 'for an admin' do
    subject { <%= class_name %>Policy.new(admin, <%= file_name %>) }
    it_behaves_like 'someone authorized'
  end
end
