class RenameReviewCountOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :review_count, :reviews_count
  end
end
