require_relative "lib/Product"
require_relative "lib/Film"
require_relative "lib/Book"
require_relative "lib/Disk"
require_relative "lib/ProductCollection"

collection = ProductCollection.from_dir("#{__dir__}/data")
collection.sort!(by: :title, order: :asc)

shopping_cart = []
cart_price = 0

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
    next
  else
    user_pick = collection.to_a[user_input]
    collection.to_a[user_input].update(amount: collection.to_a[user_input].amount - 1)
  end

  puts
  puts "Вы выбрали: #{user_pick}"
  shopping_cart << user_pick
  puts
  cart_price += user_pick.price
  puts "Вы набрали товаров на сумму: #{cart_price}"
  puts
end

puts
puts "Вы купили:"
puts

shopping_cart.each { |product| puts product }

puts
puts "С Вас - #{cart_price}. Спасибо за покупки!"
