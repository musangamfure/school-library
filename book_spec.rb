
require_relative 'book'
require_relative 'create_book_handler'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new Book object' do
      book = Book.new('Title', 'Author')
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end

    it 'initializes rentals as an empty array' do
      book = Book.new('Title', 'Author')
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new Rental and adds it to rentals' do
      book = Book.new('Title', 'Author')
      person = instance_double('Person')
      rental = book.add_rental('2023-07-26', person)
      expect(rental).to be_a(Rental)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the book' do
      book = Book.new('Title', 'Author')
      expect(book.to_hash).to eq({ title: 'Title', author: 'Author' })
    end
  end

  describe '#to_json' do
    it 'returns a JSON string representation of the book' do
      book = Book.new('Title', 'Author')
      expect(book.to_json).to eq({ title: 'Title', author: 'Author' }.to_json)
    end
  end
end

RSpec.describe CreateBookHandler do
  describe '#handle' do
    it 'creates a new book and adds it to the books collection' do
      books = []
      create_book_handler = CreateBookHandler.new(books)

      allow_any_instance_of(Kernel).to receive(:gets).and_return('Title', 'Author')
      create_book_handler.handle

      expect(books.length).to eq(1)
      expect(books.first).to be_a(Book)
      expect(books.first.title).to eq('Title')
      expect(books.first.author).to eq('Author')
    end
  end
end
