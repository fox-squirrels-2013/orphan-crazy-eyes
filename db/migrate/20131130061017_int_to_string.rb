class IntToString < ActiveRecord::Migration
  def change
    change_column :images, :instagram_id, :string
  end
end
