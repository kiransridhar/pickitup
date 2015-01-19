require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name 'Bob'
    last_name 'Dole'
    password 'password'
    password_confirmation 'password'
  end

  factory :game do
    sequence(:name) { |n| "Stanton School Court ##{n}" }
    address "50 Wawecus Ave"
    city "Norwich"
    state "MA"
    zip "06360"

    user
  end
end
