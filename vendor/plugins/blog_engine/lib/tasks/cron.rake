namespace :cron do
  task :hourly => :environment do
    puts "Hourly Cron"
    puts Post.all.count
  end
end