class CreatePictureInfos < ActiveRecord::Migration
  def change
    create_table :picture_infos do |t|
      t.references :monument, null: false
      t.string :data_id, null: false
      t.string :name
      t.text :description
      t.datetime :uploaded_at
    end

    add_index :picture_infos, :monument_id
  end
end
