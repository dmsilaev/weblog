# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story_comment, :class => 'Story::Comment' do
    body "MyText"
  end
end
