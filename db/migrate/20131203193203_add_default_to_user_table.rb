class AddDefaultToUserTable < ActiveRecord::Migration
  def change
    change_column_default :users, :subscription_id, 0
  end
end
