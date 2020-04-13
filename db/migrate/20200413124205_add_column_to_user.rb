class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :comment, :string
    add_column :users, :profile, :text
    add_column :users, :image, :string
  end
end
