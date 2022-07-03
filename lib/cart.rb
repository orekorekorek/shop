class Cart
  attr_reader :sum

  def initialize(products = [])
    @products = products
    @sum = 0
  end

  def add(product)
    product.update(quantity: product.quantity += 1)
    @sum += product.price
    return if @products.include?(product)

    @products << product
  end

  def to_s
    string = ""
    @products.each do |product|
      string += "(#{product.quantity}) #{product.title} -- #{product.price * product.quantity} руб.\n"
    end
    "#{string}\nИтого: #{@sum} руб."
  end
end
