require 'domino'

module Dom
  class CollectionForm < ::Domino
    selector '.collection_form'

    def self.instance
      first
    end

    def submit_empty_form
      within(id) { click_button 'Save' }
    end

    def submit(attributes)
      within id do
        fill_in 'Name', with: attributes[:name]
        click_button 'Save'
      end
    end

    def errors
      within(id) do
        if node.has_css? '#error_explanation'
          Array(node.find('#error_explanation ul li')).map &:text
        else
          []
        end
      end
    end
  end
end
