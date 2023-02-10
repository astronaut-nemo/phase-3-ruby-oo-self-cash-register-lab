require 'pry'

class CashRegister
    attr_writer 
    attr_accessor :discount, :total, :items, :last_transaction

    # Initialization method
    def initialize(discount = nil)
        self.total = 0
        self.discount = discount
        self.items = []
    end

    # Adds items of varying quantities and prices
    def add_item(title, price, quantity=1)
        self.total += price*quantity
        self.last_transaction = price*quantity
        quantity.times{self.items << title}
        self.items
    end

    # Calculates discounts: when the cash register is initialized with an employee discount, applies discount to the total price
    def apply_discount
        unless self.discount == nil #If the discount is not nil, apply the discount
            self.total -= self.total*discount/100
            "After the discount, the total comes to $#{self.total}."
        else # else return an error message because the discount=nil
            "There is no discount to apply."
        end
    end

    # Void the last transaction
    def void_last_transaction
        self.total -= self.last_transaction
    end
end

cash_register = CashRegister.new(20)
# binding.pry