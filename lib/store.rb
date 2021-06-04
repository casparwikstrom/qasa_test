require 'colorize'
require 'rubocop'

def store_items
  # Data
  {
    'yogurts': 20,
    'meat': 70,
    'vegetables': 50,
    'potatoes': 20,
    'rice': 10
  }
end

def product_in_store?(product)
  # Check whether product is present in the store items
  store_items.key?(product.to_sym)
end

def price_of_product(product)
  # Return the price of the given product, if it's in store. nil otherwise
  store_items[product]
end

def store_items_to_s
  # Return a String with all store items

  items = []
  store_items.each do |store_item, price|
    items << "- #{store_item}: #{price} €"
  end

  items.join("\n")
end

def calc_return_cash(total, checkout)
  until checkout == true
    customer_payment = gets.chomp.downcase
    customer_payment = customer_payment.to_i

    if customer_payment >= total
      puts "Your return is #{customer_payment - total} €"
      puts 'Have a nice day'
      checkout = true
    else
      puts "Thats not enough cash, you are missing #{total - customer_payment}"
      checkout = false
    end
  end
  total
end
