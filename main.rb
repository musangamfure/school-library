# main.rb
require_relative 'app'

def main
  puts 'Welcome to the School Library App!'

  loop do
    puts 'Choose an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a given person id'
    puts '7. Quit'

    choice = gets.chomp.to_i

    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person
    when 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid option, please try again.'
    end
  end
end

main
