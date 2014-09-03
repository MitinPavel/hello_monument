require 'rails_helper'

RSpec.describe DashboardsController, :type => :controller do
  describe "#show" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :show }
    end

    context "[search]" do
      render_views

      let(:john) { create :user }

      before { sign_in john }

      it "Searches only monuments belonging to the current user" do
        collection = create :collection, user: john
        create :monument, name: "Valentin Vodnik"
        create :monument, name: "Monument de Valentin", collection: collection

        get :show, query: "Valentin"

        found_monument_names = css_select("#search_results .monument a").map(&:children).map(&:to_s).flatten
        expect(found_monument_names).to contain_exactly('[Monument de Valentin]')
      end
    end
  end
end
