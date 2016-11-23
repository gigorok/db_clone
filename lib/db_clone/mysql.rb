module DbClone
  class MySql

    attr_accessor :conf, :env, :new_db_name

    ADAPTERS = ['mysql', 'mysql2'].freeze

    def initialize(conf, new_db_name, env)
      @conf = conf
      @new_db_name = new_db_name
      @env = env
    end

    def run_cmd!
      "mysqldump #{conf['database']} | mysql #{new_db_name}"
    end

    # command to create new database
    def create_db_cmd!
      # TODO:
    end

    def applicable?
      ADAPTERS.include?(conf['adapter'])
    end


  end
end