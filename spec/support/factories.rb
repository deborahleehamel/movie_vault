FactoryGirl.define do
  factory :user do
    email "example@tnemail.com"
    password "password"
    password_confirmation "password"
  end
end
