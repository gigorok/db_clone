namespace :db do
  desc 'Clone your development database'
  task :clone => :environment do

    puts 'something', ENV['DB_NAME']

  end
end