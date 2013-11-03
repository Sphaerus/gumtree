class CreateTextFields < ActiveRecord::Migration
  def change
    create_table :text_fields do |t|
      t.text :description
      t.references :poster, index: true
      t.timestamps
    end
  end
end
