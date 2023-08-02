# teacher_spec.rb

require_relative '../teacher'
require_relative '../create_teacher_handler'

RSpec.describe Teacher do
  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      teacher = Teacher.new(40, 'Mathematics', 'John Doe')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end

RSpec.describe CreateTeacherHandler do
  describe '#handle' do
    it 'creates a teacher with the provided details' do
      people = []
      handler = CreateTeacherHandler.new(people)

      # Stub user input
      allow_any_instance_of(Object).to receive(:gets).and_return('John Doe', '40', 'Mathematics')

      handler.handle

      expect(people.length).to eq(1)
      expect(people.first).to be_a(Teacher)
      expect(people.first.name).to eq('John Doe')
      expect(people.first.age).to eq(40)
      expect(people.first.specialization).to eq('Mathematics')
    end
  end
end
