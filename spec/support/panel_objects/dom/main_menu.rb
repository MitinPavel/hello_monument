require 'domino'

module Dom
  class MainMenu < ::Domino
    selector '#main_menu'

    def self.instance
      first
    end

    def visit_new_collection
      within(id) { click_link 'New collection' }
    end

    def visit_collections
      within(id) { click_link 'Collections' }
    end
  end
end
