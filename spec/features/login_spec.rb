require 'rails_helper'

describe "Login/logout process", :type => :feature do
  let(:email) { 'user@example.com' }
  let(:password) { 'password1' }

  before do
    ::User.create! email: email, password: password
  end

  context "[log in]" do
    it "renders an error message in case of the authentication error" do
      visit '/'

      expect {
        submit_filled_login_form 'user@example.com', 'invalid'
      }.to change { page.has_content? 'Invalid email or password.' }.from false
    end

    it "shows the dashboard page after successful login process" do
      visit '/'

      submit_filled_login_form

      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('user@example.com dashboard')
    end
  end

  context "[log out]" do
    it "renders the login form after logout" do
      visit '/'
      submit_filled_login_form

      click_link "Logout"

      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(::Dom::LoginForm.instance).to_not be_nil
    end
  end

  def submit_filled_login_form(email = email, password = password)
    ::Dom::LoginForm.instance.login_with email, password
  end
end
