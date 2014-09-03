module Search
  class IndexEntry < ActiveRecord::Base
    fuzzily_searchable :text, class_name: 'Search::Trigram'
  end
end
