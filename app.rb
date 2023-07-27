require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

# Initialize some initial data for testing purposes
@people = []
@books = []
@classrooms = []
@rentals = []

# Add some sample books
book1 = Book.new('Ruby Programming', 'John Doe')
book2 = Book.new('Python Basics', 'Jane Smith')

@books << book1
@books << book2

# ... (initialize other data as needed)

def list_books
  puts 'List of Books:'
  @books.each do |book|
    puts "#{book.title} by #{book.author}"
  end
end

def list_people
  puts 'List of People:'
  @people.each do |person|
    puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end
end

def create_student(name, age, classroom_label)
  classroom = @classrooms.find { |c| c.label == classroom_label }
  unless classroom
    classroom = Classroom.new(classroom_label)
    @classrooms << classroom
  end
  student = Student.new(age, classroom, name)
  @people << student
  puts 'Student created successfully!'
end

def create_teacher(name, age, specialization)
  teacher = Teacher.new(age, specialization, name)
  @people << teacher
  puts 'Teacher created successfully!'
end

def create_book
  puts 'Create a Book'
  puts 'Enter Title:'
  title = gets.chomp
  puts 'Enter Author:'
  author = gets.chomp

  book = Book.new(title, author)
  @books << book
  puts 'Book created successfully!'
end

def create_rental
  puts 'Create a Rental'
  puts 'Enter Person ID:'
  person_id = gets.chomp.to_i
  person = @people.find { |p| p.id == person_id }
  unless person
    puts 'Person not found!'
    return
  end

  puts 'Enter Book Title:'
  book_title = gets.chomp
  book = @books.find { |b| b.title == book_title }
  unless book
    puts 'Book not found!'
    return
  end

  puts 'Enter Rental Date (YYYY-MM-DD):'
  date = gets.chomp

  rental = Rental.new(date, person, book)
  @rentals << rental
  puts 'Rental created successfully!'
end

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
