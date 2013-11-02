class CreateDescriptionFields < ActiveRecord::Migration
  def change
    create_table :description_fields do |t|
      t.text :description

      t.timestamps
    end
  end
end
