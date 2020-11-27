require 'pg'

feature 'Signing up' do
  scenario 'A user can sign up to MakersBnB' do
    visit('/signup')
    fill_in(:username, with: 'Pablito')
    fill_in(:email, with: 'pablito@thelion.com')
    fill_in(:password, with: 'roar123')
    click_button('Sign up')
    
    expect(page).to have_content('Homes to rent')
  end
end
