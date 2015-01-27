# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'yaml'
APP_CONFIG = YAML.load(File.read(Rails.root.join("config/app_config.yml")))

Elenlace::Application.configure do

  config.action_mailer.default_url_options = { :host => APP_CONFIG['default_url'] }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
                                        :address => APP_CONFIG['smtp_host'], 
                                        :port => APP_CONFIG['smtp_port'],
                                        :user_name => APP_CONFIG['smtp_username'],
                                        :password => APP_CONFIG['smtp_password'],  
										:authentication => "plain",  
										:enable_starttls_auto => true
                                      }

end

# Initialize the Rails application.
Elenlace::Application.initialize!