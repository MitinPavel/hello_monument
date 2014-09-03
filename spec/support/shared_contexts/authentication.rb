shared_context "authenticated user" do
  before do
    ::User.create! email: 'some.email@exampel.com', password: 'some-password'

    visit '/'
    ::Dom::LoginForm.instance.login_with 'some.email@exampel.com', 'some-password'
    
    expect(page).to have_content('Signed in successfully.')
  end
end
