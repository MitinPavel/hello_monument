module Search
  class Facade
    include Singleton

    def index(text, reference_id)
      ::Search::IndexEntry.create! text: text, reference_id: reference_id
    end

    def delete(reference_id)

    end

    def find(string)
      ::Search::IndexEntry.find_by_fuzzy_text(string).map &:reference_id
    end
  end
end
