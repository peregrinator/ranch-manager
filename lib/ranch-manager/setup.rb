module RanchManager
  class Setup
    def self.setup
      create_manager_directory
      create_hostnames_file
    end

    private

    def self.create_manager_directory
      if Dir.exist?(RanchManager::MANAGER_DIR)
        Logger.info "#{RanchManager::MANAGER_DIR} exists, skipping"
      else
        Logger.info "#{RanchManager::MANAGER_DIR} does not exist, creating"

        Dir.mkdir(RanchManager::MANAGER_DIR)
        File.chmod(0777, RanchManager::MANAGER_DIR)
      end
    end

    def self.create_hostnames_file
      if File.exists?(RanchManager::HOSTNAMES_FILE)
        Logger.info "#{RanchManager::HOSTNAMES_FILE} exists, skipping"
      else
        Logger.info "#{RanchManager::HOSTNAMES_FILE} does not exist, creating"

        File.new(RanchManager::HOSTNAMES_FILE, 'w')
        File.chmod(0777, RanchManager::HOSTNAMES_FILE)
      end
    end
  end
end
