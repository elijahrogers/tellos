FactoryBot.define do
  factory :task do
    name 'MyString'
    complete false
    user
    project
  end
end
