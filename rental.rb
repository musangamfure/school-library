class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end

  def to_hash
    {
      date: @date,
      person: @person,
      book: @book
    }
  end

  def to_json(*_args)
    to_hash.to_json
  end
end
