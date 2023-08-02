require_relative 'student'
require_relative 'classroom'
require_relative 'create_student_handler'

describe Student do
  let(:classroom) { Classroom.new('1A') }
  let(:student) { Student.new(15, classroom, 'John Doe') }
  it 'has a name, age, and classroom' do
    expect(student.name).to eq('John Doe')
    expect(student.age).to eq(15)
    expect(student.classroom).to eq(classroom)
  end

  it 'is a person with the title "Student"' do
    expect(student.title).to eq('Student')
  end

  it 'can play hooky' do
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end

  it 'has parent permission by default' do
    expect(student.parent_permission).to be true
  end
  it 'can have parent permission set to false' do
    student_without_permission = Student.new(16, classroom, 'Alice', parent_permission: false)
    expect(student_without_permission.parent_permission).to be false
  end

  it 'can be added to a classroom' do
    student = Student.new(15, classroom, 'Bob')
    expect(classroom.students).to include(student)
  end
end

describe CreateStudentHandler do
  let(:people) { [] }
  let(:classrooms) { [] }
  let(:handler) { CreateStudentHandler.new(people, classrooms) }

  it 'creates a student' do
    allow($stdout).to receive(:puts)
    allow_any_instance_of(Object).to receive(:gets).and_return('John Doe', '15', '1A', 'Y')
    handler.handle
    expect(people.length).to eq(1)
    expect(people[0]).to be_a(Student)
    expect(people[0].name).to eq('John Doe')
    expect(people[0].age).to eq(15)
    expect(people[0].classroom).to be_a(Classroom)
    expect(classrooms.length).to eq(1)
    expect(classrooms[0].label).to eq('1A')
  end

  it 'creates a student without parent permission' do
    allow($stdout).to receive(:puts)
    allow_any_instance_of(Object).to receive(:gets).and_return('Alice', '16', '1B', 'N')
    handler.handle
    expect(people.length).to eq(1)
    expect(people[0]).to be_a(Student)
    expect(people[0].parent_permission).to be false
  end
end
