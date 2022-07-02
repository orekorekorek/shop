class Film < Product
  attr_accessor :title, :year, :producer, :price, :amount

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @producer = params[:producer]
  end

  def to_s
    "Фильм \"#{@title}\", #{@year}, реж. #{@producer}, " + super
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @producer = params[:producer] if params[:producer]
  end

  def self.from_file(file_path)
    movie_info = File.readlines(file_path, chomp: true)
    new(
      title: movie_info[0],
      producer: movie_info[1],
      year: movie_info[2],
      price: movie_info[3].to_i,
      amount: movie_info[4].to_i
    )
  end
end
