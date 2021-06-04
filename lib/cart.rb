# frozen_string_literal: true
require 'active_support/core_ext/hash/slice'

def add_to_cart(cart, product)
  # TODO: you get a cart and a product. Add the product to the cart!
  cart << product
end

def remove_from_cart(cart, product)
  # TODO: you get a cart and a product. Add the product to the cart!
  if !cart.include?(product)
    puts
    puts("#{product}, is not in your cart, here is your cart#{display_cart(cart, store_items)}")
  else
    cart.delete(product)
    puts("you removed #{product.red} from your cart")
  end
end

def cart_to_s(cart)
  # puts for better looking terminal
  puts
  if cart.count.zero?
    puts('Your cart is empty, add items to cart')
    puts
    puts("Or write '3' if you want to exit shop")
    answer = gets.chomp.downcase
    if answer == '3'
      exit(true)
    else
      interface
    end
  else
    cart.join(', ').green
  end
end

def cart_total_price(cart, store_items)
  # cart and the store items with their prices. Return the total and discount
  total = 0
  new_price = 0

  cart.each do |cart_item|
    total += store_items[cart_item.to_sym] if store_items[cart_item.to_sym]
  end

  symbol_cart = cart.map(&:to_sym)
  new_items = []
  store_items.each do |item|
    new_items << item if symbol_cart.include?(item[0])
  end

  cheapes_item_hash = Hash[*new_items.flatten(1)]

  if cart.count >= 3
    cheapest_item = cheapes_item_hash.values.map(&:to_f).min * 0.5
    puts "Since you are buying #{cart.count} you get a discount"

    new_price += cheapest_item
  end

  [total, new_price]
end
