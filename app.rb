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
require 'json'

class SchoolLibraryApp
  def initialize
    @people = []
    @books = []
    @classrooms = []
    @rentals = []
    load_data_from_files
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

  def save_data_to_files
    File.write('books.json', save_attr('books', @books))
    File.write('people.json', save_attr('people', @people))
    File.write('rentals.json', save_attr('rentals', @rentals))
  end

  def load_data_from_files
    @books = parse_books
    @people = parse_people
    @rentals = parse_rentals
  end

  def run
    loop do
      print_options

      choice = gets.chomp.to_i

      break if choice == 8

      print_options unless handle_option(choice)
    end

    save_data_to_files
    puts 'Goodbye!'
  end

  private

  def save_attr(attribute, arr_attr)
    temp_hash = {
      attribute => arr_attr.to_json
    }
    JSON.dump(temp_hash)
  end

  def parse_books
    parse_books = []
    temp_books = begin
      JSON.parse(JSON.parse(File.read('books.json'))['books'])
    rescue StandardError
      []
    end
    if temp_books.empty?
      parse_books = temp_books
    else
      temp_books.each do |book|
        temp_book = Book.new(book['title'], book['author'])
        temp_book.rentals = []
        parse_books << temp_book
      end
    end
    parse_books
  end

  def parse_people
    temp_people = begin
      JSON.parse(JSON.parse(File.read('people.json'))['people'])
    rescue StandardError
      []
    end
    parse_people = []
    if temp_people.empty?
      parse_people = temp_people
    else
      temp_people.each do |person|
        temp_person = parse_person(person)
        parse_people << temp_person
      end
    end
    parse_people
  end

  def parse_person(person)
    if person['title'] == 'Student'
      classroom = @classrooms.find { |c| c.label == person['classroom'] }
      unless classroom
        classroom = Classroom.new(person['classroom'])
        @classrooms << classroom
      end
      temp_student = Student.new(person['age'], classroom, person['name'],
                                 parent_permission: person['parent_permission'])
      temp_student.id = person['id'].to_i
      temp_student.rentals = []
      temp_student
    else
      temp_teacher = Teacher.new(person['age'], person['specialization'], person['name'],
                                 parent_permission: person['parent_permission'])
      temp_teacher.id = person['id'].to_i
      temp_teacher.rentals = []
      temp_teacher
    end
  end

  def parse_rentals
    parse_rentals = []
    temp_rentals = begin
      JSON.parse(JSON.parse(File.read('rentals.json'))['rentals'])
    rescue StandardError
      []
    end
    if temp_rentals.empty?
      parse_rentals = temp_rentals
    else
      temp_rentals.each do |rental|
        book = @books.find { |b| b.title == rental['book']['title'] }
        person = @people.find { |p| p.id == rental['person']['id'].to_i }
        temp_rental = Rental.new(rental['date'], person, book)
        parse_rentals << temp_rental
      end
    end
    parse_rentals
  end
end
