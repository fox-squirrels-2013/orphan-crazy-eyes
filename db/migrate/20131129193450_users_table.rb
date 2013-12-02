class UsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :access_token

      t.timestamps
    end
  end
end
