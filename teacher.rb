require_relative './person'
require 'json'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name = 'Unknown', parent_permission: true, specialization: nil)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def create_object
    super()
    object_data = @object_data
    object_data[:specialization] = @specialization
    object_data[:class] = 'Teacher'
    object_data
  end
end
