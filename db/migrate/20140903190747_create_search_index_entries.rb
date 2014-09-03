class CreateSearchIndexEntries < ActiveRecord::Migration
  def change
    create_table :search_index_entries do |t|
      t.integer :reference_id, null: false
      t.text :text, null: false
    end
  end
end
