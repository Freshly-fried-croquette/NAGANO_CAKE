class RenameGenresIdColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :genres_id, :genre_id
  end
end
