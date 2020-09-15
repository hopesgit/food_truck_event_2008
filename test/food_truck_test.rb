require "minitest/autorun"
require "minitest/pride"
require "./lib/food_truck"

class FoodTruckTest < Minitest::Test
  def setup
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: "Peach Pie (Slice)", price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  def test_it_is_food_truck
    assert_instance_of FoodTruck, @food_truck
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Pies", @food_truck.name
    assert_instance_of Hash, @food_truck.inventory
  end

  def test_items_can_be_added_to_inventory
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item2, 20)
    expected = {@item1 => 30, @item2 => 20}

    assert_equal expected, @food_truck.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @food_truck.check_stock(@item1)

    @food_truck.stock(@item1, 30)

    assert_equal 30, @food_truck.check_stock(@item1)

    @food_truck.stock(@item1, 25)

    assert_equal 55, @food_truck.check_stock(@item1)
  end

  def test_it_can_calculate_potential_revenue
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item2, 20)

    assert_equal 125.00, @food_truck.potential_revenue
  end
end
