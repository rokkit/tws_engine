CarrierWave.configure do |config|

  config.cache_dir = File.join(Rails.root, 'tmp', 'uploads')

  case Rails.env.to_sym

  when :development
    config.storage = :file
    config.root = File.join(Rails.root, 'public')

  when :production
    # the following configuration works for Amazon S3
    config.storage          = :fog
    config.fog_credentials  = {
      :provider                 => 'AWS',
      :aws_access_key_id        => 'AKIAIMLXHZMLCIYL2SEA',
      :aws_secret_access_key    => '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'
      #:region                   => ENV['S3_BUCKET_REGION']
    }
    config.fog_directory    = 'tws_site'

  else
    # settings for the local filesystem
    config.storage = :file
    config.root = File.join(Rails.root, 'public')
  end

end
