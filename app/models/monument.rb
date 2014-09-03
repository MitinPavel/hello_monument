class Monument < ActiveRecord::Base
  belongs_to :collection

  validates :name,
            presence: true,
            uniqueness: {scope: :collection_id}

  acts_as_taggable_on :categories
end
