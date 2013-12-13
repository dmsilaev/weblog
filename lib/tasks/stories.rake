namespace :stories do
  desc 'update all host stories'
  task :set_host => [:environment] do
    Story.load.each do |story|
      story.set_host!
    end
  end
end