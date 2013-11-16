class AddFieldIdToDateField < ActiveRecord::Migration
  def change
    add_reference :date_fields, :field, index: true
  end
end
