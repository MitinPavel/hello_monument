require 'rails_helper'

RSpec.describe PicturesController, :type => :controller do
  let(:monument) { create :monument }

  describe "#index" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :index, monument_id: monument.id }
    end
  end

  describe "#create" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { post :create, monument_id: monument.id }
    end
  end
end
