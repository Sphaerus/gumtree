class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps
    end
  end
end
