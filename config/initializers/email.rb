Sales::Application.configure do
  config.action_mailer.default_url_options = {
    host: APP_CONFIG['host'],
    protocol: (Rails.env.production? ? 'https' : 'http')
  }
  config.action_mailer.default_url_options[:port] = 3000 if Rails.env.development?

  config.action_mailer.smtp_settings = APP_CONFIG['smtp'].symbolize_keys
end
