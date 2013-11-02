class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :kind
      t.integer :category_id
      t.string :description

      t.timestamps
    end
  end
end
