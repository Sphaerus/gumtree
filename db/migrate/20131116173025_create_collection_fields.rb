class CreateCollectionFields < ActiveRecord::Migration
  def change
    create_table :collection_fields do |t|
      t.references :poster, index: true
      t.string :element
      t.references :field, index: true

      t.timestamps
    end
  end
end
