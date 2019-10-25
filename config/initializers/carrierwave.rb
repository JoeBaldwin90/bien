CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAZB2OREXTDUT6C46R',                     # required unless using use_iam_profile
    aws_secret_access_key: '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', # required unless using use_iam_profile
    region:                'eu-west-2',
  }
  config.fog_directory  = 'bien-reviews-2019'            # required
end
