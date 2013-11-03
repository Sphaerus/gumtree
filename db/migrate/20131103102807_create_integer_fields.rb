class CreateIntegerFields < ActiveRecord::Migration
  def change
    create_table :integer_fields do |t|
      t.integer :integer_number
      t.references :poster, index: true

      t.timestamps
    end
  end
end
