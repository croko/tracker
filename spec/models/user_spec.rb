require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should create user without errors' do
    user = build(:user)
    expect(user.save).to be(true)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }

end
