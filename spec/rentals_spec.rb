require_relative '../rentals'
require_relative '../rental'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../books'
require_relative '../people'

RSpec.describe Rentals do
  let(:books) do
    [
      Book.new('Title 1', 'Author 1'),
      Book.new('Title 2', 'Author 2'),
      Book.new('Title 3', 'Author 3')
    ]
  end

  let(:people) do
    [
      Student.new(18, 'Jamal Khan'),
      Student.new(26, 'Abir')
    ]
  end

  let(:rentals) { [] }
  let(:rental) { Rental.new('2023-03-16', books[0], people[0]) }
  let(:rental2) { Rental.new('2023-03-17', books[1], people[1]) }

  describe '#add_new_rental' do
    context 'when valid book and person are selected' do
      it 'creates a new rental' do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('1', '1', '2023-03-16')
        expect { subject.add_new_rental(books, people, rentals) }.to change { rentals.length }.by(1)
      end
    end
  end

  describe '#show_rentals' do
    context 'when rentals exist for selected person' do
      it 'displays rentals for selected person' do
        rentals << rental
        rentals << rental2
        allow_any_instance_of(Kernel).to receive(:gets).and_return(people[0].id.to_s)
        expect do
          subject.show_rentals(people, rentals)
        end.to output(/#{rental.date}, Book: "#{rental.book.title}"/).to_stdout
      end
    end

    context 'when no rentals exist for selected person' do
      it 'returns an error message' do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('1')
        expect do
          subject.show_rentals(people,
                               rentals)
        end.to output(/\e\[31mNo rentals found for this person. Please try again.\e\[0m/).to_stdout
      end
    end

    context 'when person id is 0' do
      it 'displays all rentals' do
        rentals << rental
        rentals << rental2
        allow_any_instance_of(Kernel).to receive(:gets).and_return('0')
        expect do
          subject.show_rentals(people,
                               rentals)
        end.to output(/#{rental.date}, Book: "#{rental.book.title}".+#{rental2.date}, Book: "#{rental2.book.title}"/m).to_stdout
      end
    end
  end
end
