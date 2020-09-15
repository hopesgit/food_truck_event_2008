require "./lib/item"
require "./lib/food_truck"

class Event
  def initialize(name)
    @name = name
    @food_trucks = []
  end
end
