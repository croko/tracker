require 'rails_helper'

RSpec.describe Task, :type => :model do
  it 'should create task without errors' do
    task = build(:task)
    expect(task.save).to be(true)
  end

  it { should validate_presence_of(:name) }

end
