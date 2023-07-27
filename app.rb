# app.rb
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

def create_person
  puts 'Create a Person (Student or Teacher)'
  puts 'Enter Name:'
  name = gets.chomp
  puts 'Enter Age:'
  age = gets.chomp.to_i
  puts 'Is this person a Teacher? (y/n)'
  is_teacher = gets.chomp.downcase == 'y'

  if is_teacher
    puts 'Enter Specialization:'
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
  else
    puts 'Enter Classroom Label:'
    classroom_label = gets.chomp
    classroom = @classrooms.find { |c| c.label == classroom_label }
    unless classroom
      classroom = Classroom.new(classroom_label)
      @classrooms << classroom
    end
    person = Student.new(age, classroom, name)
  end

  @people << person
  puts 'Person created successfully!'
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
