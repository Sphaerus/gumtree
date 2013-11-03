class CreateFloatFields < ActiveRecord::Migration
  def change
    create_table :float_fields do |t|
      t.float :float_number
      t.references :poster, index: true

      t.timestamps
    end
  end
end
