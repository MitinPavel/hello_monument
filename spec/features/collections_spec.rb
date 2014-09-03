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
    }.to change { has_content? 'Collection was successfully created.' }.from false

    ::Dom::MainMenu.instance.visit_collections

    expect(page).to have_content("Ljubljana 2014")
  end

  specify "a user can edit a collection" do
    collection = create :collection, user: current_user, name: "Ljubljana 2014"

    ::Dom::MainMenu.instance.visit_collections
    expect(page).to_not have_content("Ljubljana 2014 (summer)")

    within "#collection_#{collection.id}" do
      click_link "Edit"
    end

    expect {
      ::Dom::CollectionForm.instance.submit name: "Ljubljana 2014 (summer)"
    }.to change { has_content? 'Collection was successfully updated.' }.from false

    ::Dom::MainMenu.instance.visit_collections

    expect(page).to have_content("Ljubljana 2014 (summer)")
  end

  specify "a user can delete a collection" do
    collection = create :collection, user: current_user

    ::Dom::MainMenu.instance.visit_collections

    expect {
      within "#collection_#{collection.id}" do
        click_link "Delete"
      end
    }.to change { has_content? collection.name }.from true

    expect(page).to have_content("Collection was successfully deleted.")
  end
end
