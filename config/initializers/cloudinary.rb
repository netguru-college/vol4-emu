Cloudinary.config do |config|
  config.cloud_name = Rails.application.credentials.public_send((Rails.env + "_cloudinary").to_sym)[:cloud_name]
  config.api_key = Rails.application.credentials.public_send((Rails.env + "_cloudinary").to_sym)[:api_key]
  config.api_secret = Rails.application.credentials.public_send((Rails.env + "_cloudinary").to_sym)[:api_secret]
end
