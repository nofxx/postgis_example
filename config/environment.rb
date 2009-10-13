RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.i18n.default_locale = 'en'

  config.gem 'postgis_adapter', :source => 'gems.gemcutter.org', :version => '>=0.7.0'
end
