module RanchManager
  class IpManager
    def self.update_all(ip=current_ip_address.strip)
      ip ||= current_ip_address.strip

      hostnames.each do |host|
        if `ghost list | grep '#{host}'`
          update(host, ip)
        else
          add(host, ip)
        end
      end
    end

    def self.add(host, ip=current_ip_address.strip)
      ip ||= current_ip_address.strip
      Logger.info "Adding #{host} to rancher-manager with ip #{ip}"

      host = Hostname.new(*[host, ip].compact)
      Ghost.store.add(host)
    end

    def self.remove(host)
      Logger.info "Removing #{host} from rancher-manager"
      Ghost.store.delete(host)
    end

    def self.update(host, ip=current_ip_address.strip)
      ip ||= current_ip_address.strip
      Logger.info "Updating ip address for #{host}"
      remove(host)
      add(host, ip)
    end

    private

    def self.current_ip_address
      `ifconfig | grep -A 4 en0 | grep 'inet ' | awk 'BEGIN { FS = " " }; {print $2}'`
    end

    def self.hostnames
      @@hostnames ||= Hostname.all
    end
  end
end
