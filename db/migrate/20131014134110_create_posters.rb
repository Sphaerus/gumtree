class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.text :description
      t.references :user, index: true
      t.integer :range_id

      t.timestamps
    end
  end
end
