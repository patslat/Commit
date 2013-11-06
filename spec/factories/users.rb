# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'user1'
    email 'user@user.com'
    password '12345678'
  end
end
