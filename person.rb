# person.rb
require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'base_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals, :classroom, :id

  def initialize(age, title, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..200)
    @name = name
    @age = age
    @title = title
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

  def of_age?
    @age >= 18
  end
end
