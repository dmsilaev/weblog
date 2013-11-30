namespace :faker do

  desc 'create fake users'
  task :create_fake_users => [:environment] do
    puts 'START'
    1000.times do |i|
      puts i.to_s
      attrs = { email: Faker::Internet.email,
                password: "password",
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name
              }
      attrs[:login] = "#{attrs[:first_name]}_#{attrs[:last_name]}"
      user = User.create!(attrs)
      puts user.login
    end
    puts 'END'
  end

  task :create_fake_stories => [:environment] do
    puts 'START'
    1000.times do |i|
      puts i.to_s
      u = User.find(rand(10)+3)
      attrs = { title: Faker::Lorem.sentence,
                description: Faker::Lorem.paragraph,
                url: "http://#{Faker::Internet.domain_name}/#{Faker::Name.name}",
                tag_list: "#{u.first_name}, #{u.email}",
                user_id: u.id
              }
      story = Story.create!(attrs)
      puts story.title
    end
    puts 'END'
  end
end
