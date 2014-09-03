require 'domino'

module Dom
  class SearchResult < ::Domino
    selector '#search_results .monument'

    attribute :name, 'a'
  end
end
