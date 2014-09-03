RSpec.shared_examples "a controller which requires authentication" do
  it "throws an error if a user isn't authenticated" do
    user = create :user
    sign_in(:user, user) and sign_out(user) # Workaround for Devise

    expect { action }.to raise_error(/warden/)
  end
end
