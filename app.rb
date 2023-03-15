require_relative './books'
require_relative './people'
require_relative './rentals'
require_relative './datafile'
require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require 'json'

class App
  def run_command(option)
    case option
    when 1
      BookList.new().show_book_list(books)
    when 2
      People.new().show_people(people)
    when 3
      People.new().add_new_person(people)
      @people_file_path.save_data(@people.map(&:create_object))
    when 4
      BookList.new().add_new_book(books)
      @books_file_path.save_data(@books.map(&:create_object))
    when 5
      if books.empty? || people.empty?
        puts "\e[31mNo books or people in the library yet.\e[0m"
        return
      end
      Rentals.new().add_new_rental(books, people, rentals)
      @rentals_file_path.save_data(@rentals.map(&:create_object))
    when 6
      if rentals.empty?
        puts "\e[31mNo rental done in the library yet.\e[0m"
        return
      end
      Rentals.new().show_rentals(people, rentals)
    end
  end
end
