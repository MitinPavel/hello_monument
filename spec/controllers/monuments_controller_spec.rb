require 'rails_helper'

RSpec.describe MonumentsController, :type => :controller do

  describe "#new" do
    it_behaves_like "a controller which requires authentication" do
      let(:action) { get :new }
    end
  end

end
