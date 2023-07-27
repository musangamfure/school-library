require_relative 'app'

class ListBooksHandler
  def initialize(books)
    @books = books
  end

  def handle
    list_books
  end

  private

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end
end
