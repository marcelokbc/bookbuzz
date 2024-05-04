require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

def set_locate_configs_and_timezone
  config.time_zone = "Brasilia"
  config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
  config.i18n.load_path += Dir[Pagy.root.join('locales', '*.yml').to_s]
  config.i18n.available_locales = [:en, "pt-BR"]
  config.i18n.default_locale = :"pt-BR"
end

module Bookbuzz
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    
    config.autoload_lib(ignore: %w(assets tasks))

    set_locate_configs_and_timezone
  end
end
