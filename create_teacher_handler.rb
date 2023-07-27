require_relative 'app'

class CreateTeacherHandler
  def initialize(people)
    @people = people
  end

  def handle
    puts 'Enter Teacher Name:'
    name = gets.chomp
    puts 'Enter Teacher Age:'
    age = gets.chomp.to_i
    puts 'Enter Specialization:'
    specialization = gets.chomp
    create_teacher(name, age, specialization)
  end

  private

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Teacher created successfully!'
  end
end
