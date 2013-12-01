class CreateCountColumn < ActiveRecord::Migration
  def change
    add_column :images, :vote_count, :integer, :default => 0
  end
end
