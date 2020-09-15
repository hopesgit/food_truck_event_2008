require "minitest/autorun"
require "minitest/pride"
require "./lib/food_truck"

class FoodTruckTest < Minitest::Test
  def test_it_is_food_truck
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, food_truck
  end
end
