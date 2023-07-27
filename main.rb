require_relative 'app'

def print_options
  puts 'Choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a student'
  puts '4. Create a teacher'
  puts '5. Create a book'
  puts '6. Create a rental'
  puts '7. List rentals for a given person id'
  puts '8. Quit'
end

def handle_option(choice)
  option_handler = {
    1 => ListBooksHandler.new,
    2 => ListPeopleHandler.new,
    3 => CreateStudentHandler.new,
    4 => CreateTeacherHandler.new,
    5 => CreateBookHandler.new,
    6 => CreateRentalHandler.new,
    7 => ListRentalsForPersonHandler.new
  }

  handler = option_handler[choice]
  handler&.handle || puts('Invalid option, please try again.')
end

def main
  puts 'Welcome to the School Library App!'

  loop do
    print_options

    choice = gets.chomp.to_i

    break if choice == 8

    handle_option(choice)
  end

  puts 'Goodbye!'
end

main
