require_relative '../classroom'

describe Classroom do
  context 'Test for Classroom class' do
    classroom = Classroom.new('JavaScript')

    it 'if there is right label' do
      expect(classroom.label) == 'JavaScript'
    end

    it 'if there is no students' do
      expect(classroom.students.size) == 0
    end
  end
end
