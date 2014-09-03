shared_context "authenticated user" do
  let(:current_user) { create :user }

  before do
    visit '/'
    ::Dom::LoginForm.instance.login_with current_user.email, current_user.password

    expect(page).to have_content('Signed in successfully.')
  end
end
