require 'database_helpers'

feature 'Logging in as a user' do
  scenario 'A user can log in' do
    sign_up
    click_link('Log in')
    fill_in(:username, with: 'Pablito')
    fill_in(:password, with: 'roar123')
    click_button('Log in')

    expect(page).to_not have_content('Error')
    expect(page).to have_content('Homes to rent')
  end

  scenario 'a user sees an error if they get their username wrong' do
    sign_up
    visit('/sessions/new')
    fill_in(:username, with: 'Not Pablito')
    fill_in(:password, with: 'roar123')
    click_button('Log in')

    expect(page).not_to have_content('Homes to rent')
    expect(page).to have_content('Incorrect username or password')
  end

  scenario 'a user sees an error if they get their password wrong' do
    sign_up
    visit('/sessions/new')
    fill_in(:username, with: 'Pablito')
    fill_in(:password, with: 'not roar123')
    click_button('Log in')

    expect(page).not_to have_content('Homes to rent')
    expect(page).to have_content('Incorrect username or password')
  end
end
