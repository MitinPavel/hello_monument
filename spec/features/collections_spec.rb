require 'rails_helper'

describe "management of collections", :type => :feature do
  include_context "authenticated user"

  specify "a user can create a collection" do
    ::Dom::MainMenu.instance.visit_new_collection

    expect {
      ::Dom::CollectionForm.instance.submit_empty_form
    }.to change { ::Dom::CollectionForm.instance.errors }.from([]).to(["Name can't be blank"])

    expect {
      ::Dom::CollectionForm.instance.submit name: "Ljubljana 2014"
    }.to change { page.has_content? 'Collection was successfully created.' }.from false

    ::Dom::MainMenu.instance.visit_collections

    expect(page).to have_content("Ljubljana 2014")
  end
end
