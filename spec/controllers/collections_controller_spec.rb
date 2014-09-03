require 'rails_helper'

RSpec.describe CollectionsController, :type => :controller do
  describe "#index" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :index }
    end
  end

  describe "#new" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :new }
    end
  end

  describe "#create" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { post :create }
    end
  end

  describe "#edit" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :edit, id: create(:collection).id }
    end
  end

  describe "#update" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { put :update, id: create(:collection).id }
    end
  end

  describe "#destroy" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { delete :destroy, id: create(:collection).id }
    end
  end
end
