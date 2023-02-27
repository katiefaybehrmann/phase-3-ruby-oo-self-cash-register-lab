require 'pry'

class CashRegister

    attr_reader :discount
    attr_accessor :total, :items, :prices, :quantities

    def initialize(discount=nil)
        @discount = discount
        @total = 0
        @items = []
        @prices = []
        @quantities = []

    end

    def add_item(title, price, quantity=1)
        self.total += price.to_f * quantity.to_f

        self.quantities << quantity
        
        while quantity > 0
            self.items << title
            self.prices << price
            quantity -= 1
        end
    end

    def apply_discount
        if !self.discount
            "There is no discount to apply."
        else
            self.total -= self.total * (self.discount/100.00)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.quantities.last.times { self.items.pop }
        if self.items ==[]
            self.total = 0.0
        else
            self.total -= self.prices.last * self.quantities.last
        end
        self.quantities.pop
    end

end

