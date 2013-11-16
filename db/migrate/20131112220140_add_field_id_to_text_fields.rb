class AddFieldIdToTextFields < ActiveRecord::Migration
  def change
    add_reference :text_fields, :field, index: true
  end
end
