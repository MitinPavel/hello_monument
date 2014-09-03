require 'domino'
require_relative 'form_base'

module Dom
  class PictureForm < ::Domino
    include ::Dom::FormBase

    selector '.new_picture_info'

    def upload(attributes)
      within id do
        fill_in 'Name', with: attributes[:name]               if attributes[:name]
        fill_in 'Description', with: attributes[:description] if attributes[:description]

        click_button 'Upload'
      end
    end
  end
end
