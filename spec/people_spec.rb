require_relative '../rentals'
require_relative '../rental'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../books'
require_relative '../people'

RSpec.describe People do
  let(:people) { [] }
  subject(:people_obj) { described_class.new }
  let(:person) { instance_double(Student, name: 'John', id: 1, age: 20) }

  describe '#add_new_student' do
    context 'when user inputs valid student data' do
      before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return("20\n", "Amzad Hossain\n", "Y\n")
        people_obj.add_new_student(people)
      end

      it 'creates a new student and adds it to the people array' do
        expect(people.size).to eq(1)
        expect(people[0]).to be_an_instance_of(Student)
        expect(people[0].name).to eq('Amzad Hossain')
        expect(people[0].age).to eq(20)
      end
    end

    context 'when user inputs invalid student data' do
      before do
        people = []
        allow_any_instance_of(Kernel).to receive(:gets).and_return("0\n", " \n", "X\n")
        people_obj.add_new_student(people)
      end

      it 'does not create a new student and does not add it to the people array' do
        expect(people.size).to eq(0)
      end
    end
  end

  describe '#add_new_teacher' do
    context 'when user inputs valid teacher data' do
      before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return("35\n", "Abdur Rahman\n", "Math\n")
        people_obj.add_new_teacher(people)
      end

      it 'creates a new teacher and adds it to the people array' do
        expect(people.size).to eq(1)
        expect(people[0]).to be_an_instance_of(Teacher)
        expect(people[0].name).to eq('Abdur Rahman')
        expect(people[0].age).to eq(35)
        expect(people[0].specialization).to eq('Math')
      end
    end

    context 'when user inputs invalid teacher data' do
      before do
        people = []
        allow_any_instance_of(Kernel).to receive(:gets).and_return("0\n", " \n", "\n")
        people_obj.add_new_teacher(people)
      end

      it 'does not create a new teacher and does not add it to the people array' do
        expect(people.size).to eq(0)
      end
    end
  end
end
