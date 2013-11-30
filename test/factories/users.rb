# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "password"
    first_name "Bob"
    last_name "Marley"
    password_confirmation "password"
    login "login"
    # avatar "MyString"
  end
end
