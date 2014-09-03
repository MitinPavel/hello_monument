class PictureInfo < ActiveRecord::Base
  belongs_to :monument

  validates :data_id, presence: true
end
