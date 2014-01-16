require 'paypal/express'

PAYPAL_CONFIG = if ENV['PAYPAL_USERNAME']
  {
    username:  ENV['PAYPAL_USERNAME'],
    password:  ENV['PAYPAL_PASSWORD'],
    signature: ENV['PAYPAL_SIGNATURE'],
    sandbox:   ENV['PAYPAL_SANDBOX']
  }
else
  YAML.load_file("#{Rails.root}/config/paypal.yml")[Rails.env].symbolize_keys
end
Paypal.sandbox! if PAYPAL_CONFIG[:sandbox]