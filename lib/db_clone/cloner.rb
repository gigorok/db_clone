module DbClone
  class Cloner

    attr_accessor :conf, :env

    def initialize(conf, env)
      @conf = conf
      @env = env
    end

    def run_cmd!
      Kernel.system(adapter.create_db_cmd!)
      Kernel.system(adapter.run_cmd!)
    end

    def adapter
      [DbClone::Pg, DbClone::MySql].each do |klass|
        a = klass.new(conf, env)
        return a if a.applicable?
      end

      raise "unsupported adapter #{conf['adapter']}"
    end

  end
end