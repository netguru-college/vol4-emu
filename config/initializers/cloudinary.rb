Cloudinary.config do |config|
  config.cloud_name = Rails.application.credentials.public_send(("cloudinary_" + Rails.env).to_sym)[:cloud_name]
  config.api_key = Rails.application.credentials.public_send(("cloudinary_" + Rails.env).to_sym)[:cloud_name]
  config.api_secret = Rails.application.credentials.public_send(("cloudinary_" + Rails.env).to_sym)[:cloud_name]
end

Rails.application.credentials
Rails.application.public_send(:credentials)
Rails.application.credentials.public_send(("cloudinary_" + Rails.env).to_sym)
