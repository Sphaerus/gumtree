class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.references :country, index: true
      t.string :name

      t.timestamps
    end
  end
end
