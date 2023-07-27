require_relative 'app'

class CreateBookHandler
  def initialize(books)
    @books = books
  end

  def handle
    create_book
  end

  private

  def create_book
    puts 'Create a Book'
    puts 'Enter Title:'
    title = gets.chomp
    puts 'Enter Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end
end
