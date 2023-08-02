require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'list_rentals_for_person_handler'
RSpec.describe ListRentalsForPersonHandler do
  let(:person1) { Person.new(30, 'Mr.', 'John Doe', parent_permission: true) }
  let(:person2) { Person.new(20, 'Miss', 'Jane Smith', parent_permission: false) }
  let(:book1) { Book.new('Ruby Programming', 'Jane Smith') }
  let(:book2) { Book.new('Python Basics', 'John Doe') }
  let(:rental1) { Rental.new('2023-07-28', person2, book1) }
  let(:rental2) { Rental.new('2023-07-25', person1, book2) }
  describe '#handle' do
    it 'lists rentals for a given person' do
      allow_any_instance_of(Object).to receive(:gets).and_return("#{person1.id}\n")
      handler = ListRentalsForPersonHandler.new([person1, person2], [rental1, rental2])
      expect { handler.handle }.to output(
        /Rentals for #{person1.name}:.*Python Basics by John Doe, Date: 2023-07-25/m
      ).to_stdout
    end
    it 'displays an error message for an unknown person' do
      allow_any_instance_of(Object).to receive(:gets).and_return("9999\n")
      handler = ListRentalsForPersonHandler.new([person1, person2], [rental1, rental2])
      expect { handler.handle }.to output(/Person not found!/).to_stdout
    end
  end
end
