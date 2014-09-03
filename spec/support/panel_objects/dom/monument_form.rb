require 'domino'
require_relative 'form_base'

module Dom
  class MonumentForm < ::Domino
    include ::Dom::FormBase

    selector '.monument_form'

    def submit(attributes)
      within id do
        fill_in 'Name', with: attributes[:name]                   if attributes[:name]
        fill_in 'Description', with: attributes[:description]     if attributes[:description]
        fill_in 'Category list', with: attributes[:category_list] if attributes[:category_list]

        click_button 'Save'
      end
    end
  end
end
