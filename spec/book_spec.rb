require_relative '../book'
require_relative '../person'
require_relative '../rental'

RSpec.describe Book do
  let(:book) { Book.new('Ruby Programming', 'Jane Smith') }
  let(:person) { Person.new(30, 'Mr. John Doe') }

  describe '#initialize' do
    it 'creates a book with a title and an author' do
      expect(book.title).to eq('Ruby Programming')
      expect(book.author).to eq('Jane Smith')
    end

    it 'initializes an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new Rental and adds it to rentals' do
      date = '2023-07-26'
      rental = book.add_rental(date, person)

      expect(rental).to be_instance_of(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
