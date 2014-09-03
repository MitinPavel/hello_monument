require 'rails_helper'

describe "search for monuments", type: :feature, collection_list: true do
  include_context "authenticated user"

  specify "a user can search monuments using fulltext search" do
    collection = create :collection, user: current_user, name: "Ljubljana 2014"
    create :monument, name: "Valentin Vodnik",                               category_list: %w(poet),   collection: collection
    create :monument, name: "Dragon Bridge",   description: "built in 1901", category_list: %w(bridge), collection: collection

    ::Dom::MainMenu.instance.visit_search_page

    expect(::Dom::SearchResult.find_by_name("Valentin Vodnik")).to be_nil
    expect(::Dom::SearchResult.find_by_name("Dragon Bridge")).to be_nil
    search "poet"
    expect(::Dom::SearchResult.find_by_name("Valentin Vodnik")).to_not be_nil
    expect(::Dom::SearchResult.find_by_name("Dragon Bridge")).to be_nil
  end

  def search(string)
    fill_in 'query', with: string
    click_button "Search"
  end
end
