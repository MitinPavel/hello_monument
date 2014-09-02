require 'rails_helper'

RSpec.describe DashboardsController, :type => :controller do
  describe "#show" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :show }
    end
  end
end
