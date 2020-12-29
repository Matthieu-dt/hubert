class RemovePriceFromArtworks < ActiveRecord::Migration[6.0]
  def change
    remove_column :artworks, :price
  end
end
