require 'pg'

feature 'Signing up' do
  scenario 'A user can sign up to MakersBnB' do
    visit('/signup')
    sign_up

    expect(page).to have_content('Homes to rent')
  end
end
