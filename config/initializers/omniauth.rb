Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dbc, ENV['DBC_APP_ID'], ENV['DBC_APP_SECRET']
end