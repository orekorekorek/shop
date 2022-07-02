class Disk < Product
  attr_accessor :title, :executor, :genre, :year, :price, :amount

  def initialize(params)
    super
    @title = params[:title]
    @executor = params[:executor]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{@executor} - \"#{@title}\", #{@genre}, #{@year}, " + super
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @executor = params[:executor] if params[:executor]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def self.from_file(file_path)
    disk_info = File.readlines(file_path, chomp: true)
    new(
      title: disk_info[0],
      executor: disk_info[1],
      genre: disk_info[2],
      year: disk_info[3],
      price: disk_info[4].to_i,
      amount: disk_info[5].to_i
    )
  end
end
