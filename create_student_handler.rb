require_relative 'app'

class CreateStudentHandler
  def initialize(people, classrooms)
    @people = people
    @classrooms = classrooms
  end

  def handle
    puts 'Enter Student Name:'
    name = gets.chomp
    puts 'Enter Student Age:'
    age = gets.chomp.to_i
    puts 'Enter Classroom Label:'
    classroom_label = gets.chomp
    create_student(name, age, classroom_label)
  end

  private

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
end
