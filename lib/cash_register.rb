require "pry"

class CashRegister

  attr_accessor :total, :items, :price, :last, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(items, price, quantity=1)
    self.total += price * quantity
    i = 0
    while i < quantity
      self.items << items
      i += 1
    end
    self.last = self.total
  end

  def apply_discount
    if discount != 0
      self.total = (total * ((100 - discount.to_f)/100))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last
  end

end
