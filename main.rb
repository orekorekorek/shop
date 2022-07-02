require_relative "lib/Product"
require_relative "lib/Movie"
require_relative "lib/Book"

movie = Movie.new(price: 290, amount: 10)
puts "Фильм Леон стоит: #{movie.price} руб."
