class AddCollectionIdToFields < ActiveRecord::Migration
  def change
    add_reference :fields, :collection, index: true
  end
end
