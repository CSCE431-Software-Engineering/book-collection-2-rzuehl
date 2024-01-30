# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: 10.00
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created')
  end

  #test invalid title
  scenario 'invalid title' do
    visit new_book_path
    fill_in "book[title]", with: nil
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: 10.00
    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end

  #test invalid author
  scenario 'invalid author' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: nil
    fill_in "book[price]", with: 10.00
    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end

  #test invalid price
  scenario 'invalid price' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: nil
    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end
end

RSpec.describe 'Editing a book', type: :feature do
    #test edit book
    scenario 'edit book' do
      visit new_book_path
      fill_in "book[title]", with: 'harry potter'
      fill_in "book[author]", with: 'Ryan'
      fill_in "book[price]", with: 10.00
      click_on 'Create Book'
      visit books_url #or Back to books or Edit this book
      click_on "Show this book"
      click_on "Edit this book"
      fill_in "book[title]", with: 'this is a new title'
      click_on "Update Book"
      expect(page).to have_content('Book was successfully updated')
    end

    scenario 'edit book unhappy' do
      visit new_book_path
      fill_in "book[title]", with: 'harry potter'
      fill_in "book[author]", with: 'Ryan'
      fill_in "book[price]", with: 10.00
      click_on 'Create Book'
      visit books_url #or Back to books or Edit this book
      click_on "Show this book"
      click_on "Edit this book"
      fill_in "book[title]", with: nil
      click_on "Update Book"
      expect(page).to_not have_content('Book was successfully updated')
    end
end

RSpec.describe 'Deleting a book', type: :feature do
  scenario 'delete book happy' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: 10.00
    click_on 'Create Book'
    click_on "Delete book"
    click_on "Confirm Delete"
    expect(page).to have_content("Book was successfully destroyed")
  end
end
