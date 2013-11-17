class Collection < ActiveRecord::Base
  attr_accessor :element
  serialize :array, Array
  
  def add_to_collection(element)
    array << element unless element.blank?
  end
  
  def remove_from_collection(index)
    index = index.to_i
    array.delete_at(index)
  end
end
