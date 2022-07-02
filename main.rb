require_relative "lib/Product"
require_relative "lib/Movie"
require_relative "lib/Book"

products = []

leon = Movie.new(price: 290, amount: 10, title: "Леон", year: 1994, producer: "Люк Бессон")
leon.producer = "Л. Бессон"
leon.price = 990
igla = Movie.new(title: "Игла", year: 1988, producer: "Р. М. Нугманов", price: 250, amount: 3)
igla.update(price: 990, amount: 2)
math = Book.new(
  title: "Функциональный анализ",
  genre: "Учебник по математике",
  author: "У. Рудин",
  price: 990,
  amount: 2
)
math.update(genre: "Литература по мат. наукам", price: 500, amount: 1)
products << leon
products << igla
products << math

products.each { |product| puts product }
puts

movie = Movie.from_file("#{__dir__}/data/films/01.txt")
book1 = Book.from_file("#{__dir__}/data/books/01.txt")
book2 = Book.from_file("#{__dir__}/data/books/03.txt")
puts movie
puts book1
puts book2

puts

begin
  product = Product.from_file("#{__dir__}/data/books/02.txt")
rescue NotImplementedError => e
  puts "#{e.message}: метод from_file для класса Product не реализован"
end
