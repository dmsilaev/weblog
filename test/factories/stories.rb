# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    url "http://www.rubyflow.ru/items/1457"
    title "Инструкция по переходу на Capistrano 3"
    description "MyText"
    user_id 1
    tag_list "руби, рупи, хуюпи"
  end
end
