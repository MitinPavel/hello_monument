require 'domino'
require_relative 'form_base'

module Dom
  class CollectionForm < ::Domino
    include ::Dom::FormBase

    selector '.collection_form'

    def submit_empty_form
      within(id) { click_button 'Save' }
    end

    def submit(attributes)
      within id do
        fill_in 'Name', with: attributes[:name]
        click_button 'Save'
      end
    end
  end
end
