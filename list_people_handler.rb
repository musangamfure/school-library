require_relative 'app'

class ListPeopleHandler
  def initialize(people)
    @people = people
  end

  def handle
    list_people
  end

  private

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end
end
