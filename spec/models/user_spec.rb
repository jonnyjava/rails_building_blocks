require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:admin) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:first_surname) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
end
