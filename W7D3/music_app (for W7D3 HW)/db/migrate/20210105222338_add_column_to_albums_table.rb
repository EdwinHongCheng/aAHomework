class AddColumnToAlbumsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :live?, :boolean 
  end
end
