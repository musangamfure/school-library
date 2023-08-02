require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, 'Student', name)
    @classroom = classroom
    @parent_permission = parent_permission
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_hash
    {
      id: id.to_s,
      title: 'Student',
      name: @name,
      age: @age,
      classroom: @classroom.label,
      parent_permission: @parent_permission
    }
  end

  def to_json(*_args)
    to_hash.to_json
  end

  def title
    'Student'
  end
end
