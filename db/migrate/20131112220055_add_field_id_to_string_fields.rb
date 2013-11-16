class AddFieldIdToStringFields < ActiveRecord::Migration
  def change
    add_reference :string_fields, :field, index: true
  end
end
