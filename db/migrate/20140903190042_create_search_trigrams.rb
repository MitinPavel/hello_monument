class CreateSearchTrigrams < ActiveRecord::Migration
  extend Fuzzily::Migration
  trigrams_owner_id_column_type = :uuid
  self.trigrams_table_name = :search_trigrams
end
