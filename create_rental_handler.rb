require_relative 'app'

class CreateRentalHandler
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def handle
    create_rental
  end

  private

  def create_rental
    puts 'Create a Rental'
    puts 'Enter Person ID:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    unless person
      puts 'Person not found!'
      return
    end

    puts 'Enter Book Title:'
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    unless book
      puts 'Book not found!'
      return
    end

    puts 'Enter Rental Date (YYYY-MM-DD):'
    date = gets.chomp

    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created successfully!'
  end
end
