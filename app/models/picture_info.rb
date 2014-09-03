class PictureInfo < ActiveRecord::Base
  attr_accessor :file

  belongs_to :monument

  validates :data_id, presence: { message: "file must be selected" }
end
