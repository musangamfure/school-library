require_relative 'app'

class ListRentalsForPersonHandler
  def initialize(people, rentals)
    @people = people
    @rentals = rentals
  end

  def handle
    list_rentals_for_person
  end

  private

  def list_rentals_for_person
    puts 'Enter Person ID:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    unless person
      puts 'Person not found!'
      return
    end

    rentals = @rentals.select { |r| r.person == person }
    puts "Rentals for #{person.name}:"
    rentals.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author}, Date: #{rental.date}"
    end
  end
end
