class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.string :name, null: false
      t.text :description
      t.references :collection, null: false
    end

    add_index :monuments, :collection_id
  end
end
