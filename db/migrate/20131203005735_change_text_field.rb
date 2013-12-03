class ChangeTextField < ActiveRecord::Migration
  def change
    change_column :images, :pdf_image_url, :text
  end
end


