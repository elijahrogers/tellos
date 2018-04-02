FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    horizon "MyString"
    user
  end
end
