require 'rails_helper'

describe "management of monuments", :type => :feature do
  include_context "authenticated user"

  specify "a user can create a monument" do
    collection = create :collection, user: current_user, name: "Ljubljana 2014"

    ::Dom::MainMenu.instance.visit_collections

    within_collection_area(collection) { click_link "New monument" }

    expect {
      ::Dom::MonumentForm.instance.submit name: "Vodnik Monument",
                                          description: "Poet and journalist Valentin Vodnik (1758-1819)"
    }.to change { has_content? 'Monument was successfully created.' }.from false

    ::Dom::MainMenu.instance.visit_collections

    within_collection_area(collection) do
      expect(page).to have_content("Vodnik Monument")
    end
  end

  def within_collection_area(collection, &block)
    within "#collection_#{collection.id}", &block
  end
end
