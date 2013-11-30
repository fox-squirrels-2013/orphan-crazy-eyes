class ChangeVoteIdToCount < ActiveRecord::Migration
  def change
    rename_column :images, :vote_id, :count
  end
end
