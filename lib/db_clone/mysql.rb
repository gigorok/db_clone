module DbClone
  class MySql

    attr_accessor :conf, :env

    ADAPTERS = ['mysql', 'mysql2'].freeze

    def initialize(conf, env)
      @conf = conf
      @env = env
    end

    def run_cmd!
      "mysqldump #{conf['database']} | mysql #{new_db_name}"
    end

    # command to create new database
    def create_db_cmd!
      # TODO:
    end

    # new database name
    def new_db_name
      env['DB_NAME']
    end

    def applicable?
      env['adapter'].in?(ADAPTERS)
    end


  end
end