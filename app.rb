require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'list_books_handler'
require_relative 'list_people_handler'
require_relative 'create_student_handler'
require_relative 'create_teacher_handler'
require_relative 'create_book_handler'
require_relative 'create_rental_handler'
require_relative 'list_rentals_for_person_handler'

class SchoolLibraryApp
  def initialize
    @people = []
    @books = []
    @classrooms = []
    @rentals = []
  end

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

    if (handler = option_handler[choice])
      handler.handle
      true
    else
      puts 'Invalid option, please try again.'
      false
    end
  end

  def run
    loop do
      print_options

      choice = gets.chomp.to_i

      break if choice == 8

      print_options unless handle_option(choice)
    end

    puts 'Goodbye!'
  end
end
