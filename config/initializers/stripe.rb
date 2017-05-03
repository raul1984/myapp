if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_jZh9B2s2jEL1inH3vv6XsWKK',
    :secret_key => 'sk_test_1E6Rky561aoUxantDjaWX05X'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]