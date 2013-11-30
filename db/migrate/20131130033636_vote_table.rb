class VoteTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :image
      t.belongs_to :user

      t.timestamps
    end
  end
end
