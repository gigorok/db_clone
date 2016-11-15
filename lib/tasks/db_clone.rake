namespace :db do
  desc 'Clone your development database'
  task :clone => :environment do
    conf = Rails.application.config.database_configuration['development']
    cloner = DbClone::Cloner.new(conf, ENV)
    cloner.run_cmd!
  end
end