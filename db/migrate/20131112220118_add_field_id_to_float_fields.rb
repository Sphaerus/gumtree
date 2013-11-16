class AddFieldIdToFloatFields < ActiveRecord::Migration
  def change
    add_reference :float_fields, :field, index: true
  end
end
