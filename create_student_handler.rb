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
    puts 'Does the student have parent permission? (Y/N):'
    parent_permission_input = gets.chomp.downcase
    parent_permission = %w[y yes].include?(parent_permission_input)
    create_student(name, age, classroom_label, parent_permission)
  end

  private

  def create_student(name, age, classroom_label, parent_permission)
    classroom = @classrooms.find { |c| c.label == classroom_label }
    unless classroom
      classroom = Classroom.new(classroom_label)
      @classrooms << classroom
    end
    student = Student.new(age, classroom, name, parent_permission:)
    @people << student
    puts 'Student created successfully!'
  end
end
