class PrintsTable < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.integer :p_user_id
      t.text :p_image_urls

      t.timestamps
    end
  end
end
