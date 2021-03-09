class AddGenreIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :title, :integer
  end
end
