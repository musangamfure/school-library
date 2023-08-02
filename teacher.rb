require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, 'Teacher', name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      id: id.to_s,
      title: 'Teacher',
      name: @name,
      age: @age,
      specialization: @specialization,
      parent_permission: @parent_permission
    }
  end

  def to_json(*_args)
    to_hash.to_json
  end
end
