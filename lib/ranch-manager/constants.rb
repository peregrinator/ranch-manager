module RanchManager
  MANAGER_DIR = File.join(ENV['HOME'], '.rancher_manager')
  HOSTNAMES_FILE = File.join(MANAGER_DIR, 'hostnames.yml')
end
