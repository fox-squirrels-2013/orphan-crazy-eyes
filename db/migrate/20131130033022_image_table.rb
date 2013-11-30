class ImageTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_url
      t.integer :instagram_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
