require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vimocean
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Like Uptimus
    config.autoload_paths += Dir["#{config.root}/app/**/"]#.select {|v| v !~ %r{/admin/$} }
    #config.autoload_paths += Dir["#{config.root}/lib/**/"]
    #config.assets.precompile += Dir.new(Rails.root.join('app', 'assets', 'javascripts')).each.select {|v| v =~ /coffee/ }.map { |v| v.sub(/\.coffee/, '') }
    #config.assets.precompile += Dir.new(Rails.root.join('app', 'assets', 'stylesheets')).each.select {|v| v =~ /s[ca]ss/ }.map { |v| v.sub(/\.s[ca]ss/, '') }

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.generators do |g|
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.template_engine :slim
      g.stylesheets false
      g.helper false
      g.helper_specs false
      g.view_specs false
      g.test_framework :rspec
    end
  end
end
