require 'database_helpers'

feature 'Logging in as a user' do
  scenario 'A user can log in' do
    sign_up
    click_link('Log in')
    fill_in(:username, with: 'Pablito')
    fill_in(:password, with: 'roar123')
    click_button('Log in')

    expect(page).to have_content('There are many horses')
  end
end
