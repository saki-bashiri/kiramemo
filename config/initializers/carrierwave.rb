CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: '<%= Setting.aws.aws_access_key_id %>',
    aws_secret_access_key: '<%= Setting.aws.aws_secret_access_key %>',
    region: 'ap-northeaset-1',
    path_style: true
  }

  config.fog_directory = 'kiramemo'
  #config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/kiramemo'
  config.fog_public = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
end
