class Book < Product
  attr_accessor :title, :author, :genre

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга \"#{@title}\", #{@genre}, #{@author}, " + super
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  def self.from_file(file_path)
    book_info = File.readlines(file_path, chomp: true)
    Book.new(
      title: book_info[0],
      genre: book_info[1],
      author: book_info[2],
      price: book_info[3],
      amount: book_info[4]
    )
  end
end
