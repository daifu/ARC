class PresentationSlide < Asset
  has_attached_file :attachment,
                  :path => "assets/file_attachments/:id-:filename",
                  :storage => :s3,
                  :bucket => ENV['S3_BUCKET_NAME'],
                  :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                  }
end