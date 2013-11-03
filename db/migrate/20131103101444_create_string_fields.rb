class CreateStringFields < ActiveRecord::Migration
  def change
    create_table :string_fields do |t|
      t.string :detail
      t.references :poster, index: true

      t.timestamps
    end
  end
end
