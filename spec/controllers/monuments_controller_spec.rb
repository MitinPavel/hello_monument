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
  end

  describe "#destroy" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { delete :destroy, default_params }
    end
  end
end
