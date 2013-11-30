class VoteTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :image
      t.belongs_to :user
      t.integer :count

      t.timestamps
    end
  end
end
