class Monument < ActiveRecord::Base
  belongs_to :collection
  has_many :picture_infos, dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: {scope: :collection_id}

  acts_as_taggable_on :categories

  after_save :index_for_search

  private

  def index_for_search
    text = [self.name, self.description, category_list].compact.join " "
    ::Search::Facade.instance.index(text, self.id)
  end
end
