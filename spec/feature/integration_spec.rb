# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Kiran'
    fill_in 'Price', with: 9.99
    select "20", :from => "book_published_date_3i"
    select "October", :from => "book_published_date_2i"
    select "2002", :from => "book_published_date_1i"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    click_on 'Show'
    expect(page).to have_content('Kiran')
    expect(page).to have_content(9.99)
    expect(page).to have_content("2002-10-20")
  end
end