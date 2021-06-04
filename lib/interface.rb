# frozen_string_literal: true

require_relative 'store'
require_relative 'cart'
require 'colorize'

# frozen_string_literal: true

def display_cart(cart, store_items)
  checkout = false
  # Display content of basket & total price
  puts 'Here is your order:'

  puts cart_to_s(cart)

  total, discount = cart_total_price(cart, store_items)
  discount_cost = total - discount
  puts "That will be a total of: #{total}€"
  puts "With your discount price is: #{discount_cost}€"
  puts 'Write the amount of cash you have'

  if cart.count >= 3 && discount != (0 || 0.0)
    calc_return_cash(discount_cost,
                     checkout)
  else
    calc_return_cash(discount, checkout)
  end
end

def interface
  cart = []

  # loop forever
  loop do
    # ask which product to buy
    puts 'Press 1 to buy item'.blue
    puts 'Press 2 to remove item from cart'.blue
    puts 'Press 3 to check out'.blue
    puts

    choice = gets.chomp.downcase

    # break loop if product is empty
    break if choice == '3'

    case choice
    when '1'

      puts 'Here are the available products:'
      puts store_items_to_s
      puts 'What do you want to buy'
      product = gets.chomp.downcase

      if product_in_store?(product)
        add_to_cart(cart, product)
        puts "your current cart is #{cart_to_s(cart)}"
      else
        # otherwise show error
        puts "We don't have any #{product} in store, sorry!"
      end

    when '2'
      puts "your current cart is #{cart_to_s(cart)}"

      product = gets.chomp.downcase
      if product == ''
        product = gets.chomp.downcase
        remove_from_cart(cart, product)
      else
        remove_from_cart(cart, product)
      end

      puts cart_to_s(cart)
    end
  end
  display_cart(cart, store_items)
end
# simple starting of method
puts "Welcome to your local shop, say 'hello' to enter"
answer = gets.chomp.downcase
if answer == 'hello'
  interface
else
  puts('No rude customers')
end
