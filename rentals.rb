class Rentals
  def add_new_rental(books, people, rentals)
    book = select_book(books)
    person = select_person(people)
    if person && book
      print 'Date: '
      date = gets.chomp.to_s
      rentals << Rental.new(date, book, person)
      puts 'Rental created successfully.'
    else
      puts "\e[31mInvalid person or book selected. Please try again.\e[0m"
    end
  end

  def select_book(books)
    puts 'Select a book from the following list by number '
    books.each_with_index do |book, index|
      puts "\e[34m#{index + 1}. #{BookList.new().show_book(book)}\e[0m"
    end
    book_idx = gets.chomp.to_i - 1
    books[book_idx]
  end

  def select_person(people)
    puts 'Select a person from the following list by number (not id) '
    people.each_with_index do |person, index|
      puts "\e[34m#{index + 1}. #{People.new().show_person(person)} \e[0m"
    end
    person_idx = gets.chomp.to_i - 1
    people[person_idx]
  end
end