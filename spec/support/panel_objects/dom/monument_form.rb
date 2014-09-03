require 'domino'
require_relative 'form_base'

module Dom
  class MonumentForm < ::Domino
    include ::Dom::FormBase

    selector '.monument_form'

    def submit(attributes)
      within id do
        fill_in 'Name', with: attributes[:name]
        fill_in 'Description', with: attributes[:description] if attributes[:description]
        click_button 'Save'
      end
    end
  end
end
