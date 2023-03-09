class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission = true, classroom = nil)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
