require_relative '../rentals'
require_relative '../rental'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../books'
require_relative '../people'

RSpec.describe BookList do
  let(:book_list) { BookList.new }
  let(:books) { [] }

  describe '#add_new_book' do
    it 'adds a new book to the list of books' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("Harry Potter\n", "J.K. Rowling\n")
      book_list.add_new_book(books)
      expect(books.length).to eq(1)
      expect(books.first.title).to eq('Harry Potter')
      expect(books.first.author).to eq('J.K. Rowling')
    end
  end

  describe '#show_book_list' do
    context 'when there are no books in the library' do
      it 'prints a message saying there are no books' do
        expect { book_list.show_book_list(books) }.to output("\e[31mNo books in the library yet.\e[0m\n").to_stdout
      end
    end

    context 'when there are books in the library' do
      let(:book1) { Book.new('Harry Potter', 'J.K. Rowling') }
      let(:book2) { Book.new('The Lord of the Rings', 'J.R.R. Tolkien') }
      let(:books) { [book1, book2] }

      it 'prints the list of books' do
        expect do
          book_list.show_book_list(books)
        end.to output("\e[34mTitle: \"Harry Potter\", Author: J.K. Rowling \e[0m\n\e[34mTitle:
          \"The Lord of the Rings\", Author: J.R.R. Tolkien \e[0m\n").to_stdout
      end
    end
  end

  describe '#show_book' do
    let(:book) { Book.new('Harry Potter', 'J.K. Rowling') }

    it 'returns a formatted string with the book title and author' do
      expect(book_list.show_book(book)).to eq("\e[34mTitle: \"Harry Potter\", Author: J.K. Rowling \e[0m")
    end
  end
end
