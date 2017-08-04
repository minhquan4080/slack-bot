require File.expand_path('../boot', __FILE__)

require_relative 'all'
require_relative 'database_hardcore'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SlackBotOnRails
  class Application < Rails::Application
    config.time_zone = 'Asia/Ho_Chi_Minh'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    config.i18n.default_locale = :en
    config.autoload_paths << Rails.root.join('lib')
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :sidekiq

    config.browserify_rails.paths << /vendor\/assets\/javascripts\/module\.js/
    config.browserify_rails.source_map_environments << "development"
    config.browserify_rails.evaluate_node_modules = true
    config.browserify_rails.node_env = "production"
  end
end
