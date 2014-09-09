# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    ignore do
      task nil
    end
    ignore do
      user nil
    end
    body "Comment text"
  end
end
