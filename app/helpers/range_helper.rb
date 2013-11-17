module RangeHelper
  def list_countries_and_children
    array = []
    Country.all.each do |country|
      array << country
      country.states.each do |state|
        array << state
        states.towns.each do |town|
          array << town
        end
      end
    end
    array
  end
end