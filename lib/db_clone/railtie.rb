module DbClone
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/db_clone.rake'
    end
  end
end