require 'rails_helper'

RSpec.describe MonumentsController, :type => :controller do
  let(:monument) { create :monument }
  let(:collection) { monument.collection }
  let(:default_params) { {collection_id: collection.id, id: monument.id} }

  describe "#new" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :new }
    end
  end

  describe "#create" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { post :create, collection_id: collection.id }
    end
  end

  describe "#edit" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :edit, default_params }
    end
  end

  describe "#update" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { put :update, default_params }
    end

    context "[monument categories]" do
      let(:john) { create :user }
      let(:jill) { create :user }

      before { sign_in john }

      it "treats tags of different users as completely independent" do
        johns_monument = create :monument, collection: create(:collection, user: john), category_list: %w(poet)
        jills_monument = create :monument, collection: create(:collection, user: jill), category_list: %w(poet)

        put :update,
            collection_id: johns_monument.collection.id,
            id: johns_monument.id,
            monument: {category_list: 'songster'}

        expect(johns_monument.reload.category_list).to eq(["songster"])
        expect(jills_monument.reload.category_list).to eq(["poet"])
      end
    end
  end

  describe "#destroy" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { delete :destroy, default_params }
    end
  end
end
