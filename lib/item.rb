class Item
  def initialize(info)
    @name = info[:name]
    @price = info[:price].delete("$").to_i
  end
end
