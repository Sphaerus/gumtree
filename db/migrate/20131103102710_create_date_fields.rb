class CreateDateFields < ActiveRecord::Migration
  def change
    create_table :date_fields do |t|
      t.date :date
      t.references :poster, index: true

      t.timestamps
    end
  end
end
