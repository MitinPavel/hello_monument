class CreateStoragePictures < ActiveRecord::Migration
  def change
    create_table :storage_pictures do |t|
      t.attachment :asset
    end
  end
end
