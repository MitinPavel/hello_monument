class Monument < ActiveRecord::Base
  belongs_to :collection
  has_many :picture_infos, dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: {scope: :collection_id}

  acts_as_taggable_on :categories
end
