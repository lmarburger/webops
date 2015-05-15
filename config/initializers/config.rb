Rails.application.config.x.pagerduty.account = ENV['PAGERDUTY_ACCOUNT'] || raise("Missing ENV['PAGERDUTY_ACCOUNT']")
Rails.application.config.x.pagerduty.token   = ENV['PAGERDUTY_TOKEN']   || raise("Missing ENV['PAGERDUTY_TOKEN']")
