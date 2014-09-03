require 'rails_helper'

RSpec.describe ::Storage::Facade, :type => :model do
  let(:file) { File.new("#{Rails.root}/spec/fixtures/files/test_img.jpg") }

  describe "#store_file" do
    it "returns an identifier of the stored file" do
      id = described_class.instance.store_file file
      expect(id).to_not be_nil
    end
  end

  describe "#thumbnail_url" do
    let(:file_id) { described_class.instance.store_file file }

    it "returns a path to the storage directory (example: /system/storage/test/9c96d9663fdf3cb0a2e96d10781c83d64f062728.jpg?1409766501)" do
      url = described_class.instance.thumbnail_url file_id

      expect(url).to match(%r{/system/storage/test/\w+\.jpg\?\d+})
    end
  end
end
