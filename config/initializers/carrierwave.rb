CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.credentials.aws_access_key,     # required unless using use_iam_profile
    aws_secret_access_key: Rails.application.credentials.aws_secret_key, # required unless using use_iam_profile
    region:                'eu-west-2',
  }
  config.fog_directory  = Rails.application.credentials.fog_directory            # required
end
