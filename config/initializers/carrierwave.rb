#Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')
CarrierWave.configure do |config|
=begin
  #config.storage = :grid_fs
  #config.grid_fs_access_url = "/uploads"
  config.fog_credentials = { provider: 'AWS'}
  # config.fog_directory  = "name_of_bucket" # required
  # config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315360000'}  # optional, defaults to {}
=end

  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'xxxxxxxxxxxxxx',
      :aws_secret_access_key  => 'xxxxxxxxxxxxxx'
  }
  config.fog_directory  = 'xxxxxxxxx' # bucket name
end
