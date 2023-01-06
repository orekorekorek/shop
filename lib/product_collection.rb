class ProductCollection
  PRODUCT_TYPES = [
    { dir: 'films', class: Film },
    { dir: 'books', class: Book },
    { dir: 'disks', class: Disk }
  ].freeze

  attr_reader :products

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir["#{dir_path}/#{product_dir}/*.txt"].each { |path| products << product_class.from_file(path) }
    end

    new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by!(&:title)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:amount)
    end

    @products.reverse! if params[:order] == :asc

    self
  end
end
