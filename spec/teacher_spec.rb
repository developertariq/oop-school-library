require_relative '../teacher'

describe Teacher do
  context 'Test for the Teacher class' do
    age = 32
    name = 'Tekhlay'
    specialization = 'JavaScript'
    teacher = Teacher.new(age, specialization, name)
    it 'if is instance of class' do
      expect(teacher.instance_of?(Teacher)) == true
    end
    it 'if there are right age' do
      expect(teacher.age).to eq 32
    end
    it 'if there are right name' do
      expect(teacher.name).to eq 'Tekhlay'
    end
    it 'if there are right specialization' do
      expect(teacher.specialization).to eq 'JavaScript'
    end
    it 'if can rent a book' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
