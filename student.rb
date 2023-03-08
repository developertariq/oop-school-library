class Student < Person
  attr_accessor :classroom
  
  def initialize( age, name = "Unknown", parent_permission = true, classroom = nil)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.add_student(self) if classroom
  end
  
  def play_hooky
    "¯\\_(ツ)_/¯"
  end
end
