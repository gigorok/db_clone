module DbClone
  class Pg

    attr_accessor :conf, :env, :new_db_name

    ADAPTERS = ['postgresql'].freeze

    def initialize(conf, new_db_name, env)
      @conf = conf
      @new_db_name = new_db_name
      @env = env

      set_psql_env
    end

    def applicable?
      ADAPTERS.include?(conf['adapter'])
    end

    # command to clone database
    def run_cmd!
      "pg_dump #{pg_dump_args} | psql #{new_db_name}"
    end

    # command to create new database
    def create_db_cmd!
      "createdb -e #{new_db_name}"
    end

    private

    # pg_dump options:
    # -s - schema-only
    # -x - no-privileges
    # -O - no-owner
    def pg_dump_args
      ['-x', '-O', if schema_only
                     '-s'
                   end, conf['database']].compact.join(' ')
    end

    def schema_only
      env['SCHEMA-ONLY']
    end

    # set postgresql environment
    def set_psql_env
      ENV["PGHOST"] = conf["host"] if conf["host"]
      ENV["PGPORT"] = conf["port"].to_s if conf["port"]
      ENV["PGPASSWORD"] = conf["password"].to_s if conf["password"]
      ENV["PGUSER"] = conf["username"].to_s if conf["username"]
    end

  end
end