class AddFieldIdToIntegerFields < ActiveRecord::Migration
  def change
    add_reference :integer_fields, :field, index: true
  end
end
