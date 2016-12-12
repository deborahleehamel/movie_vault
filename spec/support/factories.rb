FactoryGirl.define do
  factory :user do
    email "example@tnemail.com"
    password "password"
    password_confirmation "password"
  end

  factory :movie do
    title "Groundhog Day"
    note "Soooo funny!"
    watched false
    user
  end
end
