require_relative '../classroom'
require_relative '../student'
RSpec.describe Classroom do
  let(:classroom) { Classroom.new('1A') }
  describe '#initialize' do
    it 'creates a classroom with a label' do
      expect(classroom.label).to eq('1A')
    end
    it 'initializes an empty students array' do
      expect(classroom.students).to be_empty
    end
  end
  describe '#add_student' do
    let(:student) { Student.new(15, classroom, 'John Doe', parent_permission: true) }
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
    it 'sets the classroom attribute of the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
