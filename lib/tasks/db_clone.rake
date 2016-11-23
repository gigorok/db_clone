namespace :db do

  # rake db:clone[new_db_name] [SCHEMA-ONLY=1]
  desc 'Clone your development database'
  task :clone, [:new_db_name] do |_t, args|
    args.with_defaults(new_db_name: ('a'..'z').to_a.shuffle[0, 8].join)

    cloner = DbClone::Cloner.new(args.new_db_name, ENV)
    cloner.run_cmd!

    puts "New database #{args.new_db_name} was created successfully"

  end
end