require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
production:
  adapter: postgresql
  encoding: unicode
  database: db/production.postgresql
  pool: 5
  username: test_postgre
  password:

module LyziarskaSkola
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.app_generators.scaffold_controller = :scaffold_controller
    config.active_record.time_zone_aware_types = [:datetime]
  end
end
