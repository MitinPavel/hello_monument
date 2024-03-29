##
# Storage::Picture belongs to "file storage" bounded context.
# Don't touch the class directly from the outside. Use Storage::Facade
# to interact with the storage.
#
class Storage::Picture < ActiveRecord::Base
  self.table_name = :storage_pictures

  asset_config = if Rails.env.production?
                   {storage: :dropbox,
                    dropbox_credentials: Rails.root.join("config/dropbox.yml")}
                 else
                   {url: "/system/storage/#{Rails.env}/:hash.:extension",
                    hash_secret: "ak9Yae0oMaigh6iogi8vaeZaeengiuG8ohS3EimuAhc4ooliuophuo0LSaphoh0a"}
                 end
  has_attached_file :asset, asset_config


  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  validates :asset, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :asset
  validates_with AttachmentSizeValidator, attributes: :asset, less_than: 10.megabytes
end
