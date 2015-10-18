CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws.aws_access_key_id,
    aws_secret_access_key: Settings.aws.aws_secret_access_key,
    endpoint: "https://s3.amazonaws.com",
    region: 'ap-northeast-1'
  }

  config.fog_directory = 'kiramemo'
  config.fog_public = false
end
