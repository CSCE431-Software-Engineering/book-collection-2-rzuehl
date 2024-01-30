# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: 10.00
    fill_in "book[date]", with: '2022-10-01'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created')
  end

  #test invalid title
  scenario 'invalid title' do
    visit new_book_path
    fill_in "book[title]", with: nil
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: 10.00
    fill_in "book[date]", with: '2022-10-01'
    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end

  #test invalid author
  scenario 'invalid author' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: nil
    fill_in "book[price]", with: 10.00
    fill_in "book[date]", with: '2022-10-01'

    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end

  #test invalid price
  scenario 'invalid price' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: nil
    fill_in "book[date]", with: '2022-10-01'
    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end

  scenario 'invalid date' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'Ryan'
    fill_in "book[price]", with: 10.00
    fill_in "book[date]", with: nil
    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end
end
