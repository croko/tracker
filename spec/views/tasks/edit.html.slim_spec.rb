require 'rails_helper'

RSpec.describe "tasks/edit", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "MyString",
      :description => "MyString",
      :status => 1,
      :user => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "input#task_status[name=?]", "task[status]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"
    end
  end
end
