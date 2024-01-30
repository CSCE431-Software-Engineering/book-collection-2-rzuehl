# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created')
  end

  scenario 'invalid title' do
    visit new_book_path
    fill_in "book[title]", with: ""
    click_on 'Create Book'
    expect(page).to_not have_content('Book was successfully created')
  end
end
