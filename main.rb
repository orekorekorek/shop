require_relative "lib/product"
require_relative "lib/film"
require_relative "lib/book"
require_relative "lib/disk"
require_relative "lib/product_collection"
require_relative "lib/cart"

collection = ProductCollection.from_dir("#{__dir__}/data")
collection.sort!(by: :title, order: :asc)

shopping_cart = Cart.new

loop do
  puts "Что хотите купить?"
  puts
  collection.to_a.each_with_index do |product, index|
    index += 1
    puts "#{index}. #{product}"
  end
  puts "0. Выход"
  puts
  print ">"
  user_input = $stdin.gets.to_i until (0..collection.to_a.size).include?(user_input)
  break if user_input.zero?

  user_input -= 1

  if (collection.to_a[user_input].amount - 1).negative?
    puts "Такого товара не осталось(("
    puts shopping_cart
    next
  else
    user_pick = collection.to_a[user_input]
    collection.to_a[user_input].update(amount: collection.to_a[user_input].amount - 1)
  end

  puts
  puts "Вы выбрали: #{user_pick}"
  shopping_cart.add(user_pick)
  puts
  puts shopping_cart
  puts
end

puts
puts "Вы купили:"
puts

puts shopping_cart
puts "Спасибо за покупку!"
