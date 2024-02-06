class AddTitleToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :title, :string
  end
end
