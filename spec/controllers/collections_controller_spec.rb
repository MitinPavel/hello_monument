require 'rails_helper'

RSpec.describe CollectionsController, :type => :controller do
  describe "#new" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :new }
    end
  end

  describe "#index" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :index }
    end
  end
end
