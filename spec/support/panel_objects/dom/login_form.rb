require 'domino'

module Dom
  class LoginForm < ::Domino
    selector '#new_user'

    def self.instance
      first
    end

    def login_with(email, password)
      within id do
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        click_button 'Log in'
      end
    end
  end
end
