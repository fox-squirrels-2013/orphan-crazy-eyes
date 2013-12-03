class AddPdfImageUrl < ActiveRecord::Migration
  def change
    add_column :images, :pdf_image_url, :string
  end
end
