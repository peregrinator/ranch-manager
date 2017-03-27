module RanchManager
  class Hostname
    attr_accessor :name, :ip
    def initialize(name, ip)
      @name = name
      @ip = ip
    end

    def self.all
      YAML.load_file(RanchManager::HOSTNAMES_FILE).strip.split
    end
  end
end
