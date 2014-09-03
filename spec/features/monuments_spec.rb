require 'rails_helper'

describe "management of monuments", type: :feature, collection_list: true do
  include_context "authenticated user"

  specify "a user can create a monument" do
    collection = create :collection, user: current_user, name: "Ljubljana 2014"

    ::Dom::MainMenu.instance.visit_collections

    within_collection_area(collection) { click_link "New monument" }

    expect {
      ::Dom::MonumentForm.instance.submit name: "Vodnik Monument",
                                          description: "1758-1819"
    }.to change { has_content? 'Monument was successfully created.' }.from false

    ::Dom::MainMenu.instance.visit_collections

    within_collection_area(collection) do
      expect(page).to have_content("Vodnik Monument")
    end
  end

  specify "a user can edit a monument" do
    monument = create :monument, name: "Vodnik Monument", collection: create(:collection, user: current_user, name: "Ljubljana 2014")

    expect {
      ::Dom::MainMenu.instance.visit_collections
      within_monument_area(monument) { click_link "Edit" }

      ::Dom::MonumentForm.instance.submit name: "Vodnik Monument (1758-1819)"
      ::Dom::MainMenu.instance.visit_collections
    }.to change { has_content? 'Vodnik Monument (1758-1819)' }.from false
  end

  specify "a user can tag a monument with categories" do
    monument = create :monument, collection: create(:collection, user: current_user)

    # No category.
    ::Dom::MainMenu.instance.visit_collections
    within_monument_area(monument) do
      expect(page).to_not have_content("poet")
      click_link "Edit"
    end

    # Tag with 'poet'.
    ::Dom::MonumentForm.instance.submit category_list: "poet"
    ::Dom::MainMenu.instance.visit_collections
    within_monument_area(monument) do
      expect(page).to have_content("Categories: poet")
      click_link "Edit"
    end

    # Tag with 'journalist' and 'poet'.
    ::Dom::MonumentForm.instance.submit category_list: "journalist, poet"
    ::Dom::MainMenu.instance.visit_collections
    within_monument_area(monument) do
      expect(page).to have_content("Categories: journalist, poet")
    end
  end
end
