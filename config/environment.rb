RAILS_GEM_VERSION = '2.0.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
    config.active_record.observers = :account_observer
    config.active_record.colorize_logging = false
    config.action_controller.session = { :session_key => "_infernalhosting.net_session_id", :secret => "aba64755b2ba68801a71d0734840b69169c45c4ffc55908401820315886bbcbea159535c643b95991360e38b3686a982ead7851092daf6f22a60dfc377d5f3f4" }
end

require 'haml'
#require 'active_merchant'
#require 'money'
