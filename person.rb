require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'base_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals, :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..200)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end
end
