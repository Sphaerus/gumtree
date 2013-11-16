class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.text :content
      t.references :user, index: true
      t.integer :range_id
      t.string :range_type
      t.integer :category_id

      t.timestamps
    end
  end
end
