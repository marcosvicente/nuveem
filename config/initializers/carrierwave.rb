CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = Rails.root.join('tmp')
  end
  
  config.cache_dir = Rails.root.join('tmp/uploads') # To let CarrierWave work on heroku
end