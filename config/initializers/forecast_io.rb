require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = Rails.application.credentials.forecast_io_key
end