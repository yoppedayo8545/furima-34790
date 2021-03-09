class RenameTitleColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :title, :genre_id
  end
end
