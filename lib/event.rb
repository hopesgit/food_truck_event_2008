require "./lib/item"
require "./lib/food_truck"

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory[item] > 0
    end
  end

  def unique_items
    @food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
  end

  def item_total(item)
    @food_trucks.sum do |truck|
      truck.check_stock(item)
    end
  end

  def total_inventory
    unique_items.reduce({}) do |outside_hash, item|
      outside_hash[item] = Hash[quantity: item_total(item), food_trucks: food_trucks_that_sell(item)]
      outside_hash
    end
  end

  def find_all_overstocked_items
    total_inventory.find_all do |item|
      item[1][:quantity] > 50 && item[1][:food_trucks].count > 1
    end
  end

  def overstocked_items
    find_all_overstocked_items.flatten.find_all do |overstock|
      overstock.class == Item
    end
  end

  def sorted_item_list
    unique_items.map do |item|
      item.name
    end.sort
  end
end
