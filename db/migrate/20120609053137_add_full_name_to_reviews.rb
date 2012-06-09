class AddFullNameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :full_name, :string
    add_column :reviews, :role, :string
  end
end
