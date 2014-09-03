require 'rails_helper'

describe "management of pictures", type: :feature, collection_list: true do
  include_context "authenticated user"

  let!(:collection) { create :collection, user: current_user, name: "Ljubljana 2014" }
  let!(:monument) { create :monument, collection: collection, name: "Vodnik Monument" }

  specify "a user can upload a picture" do
    # Go to the pictures page.
    ::Dom::MainMenu.instance.visit_collections
    within_monument_area(monument) do
      click_link "Pictures"
    end
    expect(has_selector? 'h1', text: "Pictures for Vodnik Monument").to be_truthy

    # Upload a picture
    expect {
      expect {
        ::Dom::PictureForm.instance.upload name: "evening", description: "Just beautiful"
      }.to change { has_content? "evening" }.from false
    }.to change { has_content? "Just beautiful" }.from false
    expect(has_content? 'Picture was successfully uploaded.').to be_truthy
  end
end
