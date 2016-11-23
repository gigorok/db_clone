module DbClone
  class Cloner

    attr_accessor :new_db_name, :env_args

    def initialize(new_db_name, env_args)
      @new_db_name, @env_args = new_db_name, env_args
    end

    def run_cmd!
      Kernel.system(adapter.create_db_cmd!)
      Kernel.system(adapter.run_cmd!)
    end

    def adapter
      [DbClone::Pg, DbClone::MySql].each do |klass|
        a = klass.new(conf, new_db_name, env_args)
        return a if a.applicable?
      end

      raise "unsupported adapter #{conf['adapter']}"
    end

    def conf
      Rails.application.config.database_configuration['development']
    end

  end
end