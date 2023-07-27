require_relative 'app'
require_relative 'list_books_handler'
require_relative 'list_people_handler'
require_relative 'create_student_handler'
require_relative 'create_teacher_handler'
require_relative 'create_book_handler'
require_relative 'create_rental_handler'
require_relative 'list_rentals_for_person_handler'

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
    1 => ListBooksHandler.new(@books),
    2 => ListPeopleHandler.new(@people),
    3 => CreateStudentHandler.new(@people, @classrooms),
    4 => CreateTeacherHandler.new(@people),
    5 => CreateBookHandler.new(@books),
    6 => CreateRentalHandler.new(@people, @books, @rentals),
    7 => ListRentalsForPersonHandler.new(@people, @rentals)
  }

  loop do
    if (handler = option_handler[choice])
      handler.handle
      break
    else
      puts 'Invalid option, please try again.'
      print_options
      choice = gets.chomp.to_i
    end
  end
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
