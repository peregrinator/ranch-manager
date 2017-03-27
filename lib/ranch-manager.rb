require 'pry' if ENV['DEBUG']

require 'ghost'
require 'logger'
require 'yaml'

require 'ranch-manager/version.rb'

# Add requires for other files you add to your project here, so
# you just need to require this one file in your bin file
require 'ranch-manager/constants.rb'
require 'ranch-manager/logger.rb'

require 'ranch-manager/hostname.rb'
require 'ranch-manager/ip_manager.rb'
require 'ranch-manager/setup.rb'
