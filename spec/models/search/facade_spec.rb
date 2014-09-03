require 'rails_helper'

RSpec.describe Search::Facade, type: :model do
  describe "#find" do
    it "returns an empty array if nothing found" do
      expect(find("quick")).to be_empty
      add_to_index "The quick brown fox", 1
      expect(find("invalid")).to be_empty
    end

    it "returns reference ids for found entries" do
      add_to_index "The quick brown fox", 1
      add_to_index "The quick brown fox jumps over the lazy dog", 2
      add_to_index "The quick brown fox jumps over the quick dog", 3
      add_to_index "Brown fox brown dog", 4

      expect(find("QUICK!")).to match_array([1, 2, 3])
      expect(find("lazy")).to contain_exactly(2)
      expect(find("lasy")).to contain_exactly(2)
    end
  end

  def find(string)
    described_class.instance.find string
  end

  def add_to_index(text, reference)
    described_class.instance.index text, reference
  end
end
