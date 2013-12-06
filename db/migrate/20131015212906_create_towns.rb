class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.references :province, index: true
      t.string :name

      t.timestamps
    end
  end
end
