class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental
  end

  def to_hash
    {
      title: @title,
      author: @author
    }
  end

  def to_json(*_args)
    to_hash.to_json
  end
end
