class AddSubstitleToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :subtitle, :string
  end
end
