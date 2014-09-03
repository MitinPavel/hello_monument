module Search
  class Trigram < ActiveRecord::Base
    include Fuzzily::Model
  end
end
