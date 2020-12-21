class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|

      t.string :name
      t.integer :price
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
