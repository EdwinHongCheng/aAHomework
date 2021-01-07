class CMakeChangesToAlbumsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :live?
    add_column :albums, :live? , :boolean, null: false
  end
end
