namespace :sync do
  desc "Synchronization for Unix"
  task :nix do
    system "rsync -ruv vendor/plugins/blog_engine/db/migrate db"
    puts "Unix"
  end

  desc "Synchronization for Windows"
  task :windows do
    puts "Windows"
  end

end