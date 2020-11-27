require 'database_helpers'

feature 'Adding a new home' do
  scenario 'A user can add a home to the list' do
    sign_up
    click_button('Log in')
    fill_in(:username, with: 'Pablito')
    fill_in(:password, with: 'roar123')
    click_button('Log in')
    click_link('Add home')
    fill_in('name', with: 'Test home')
    fill_in('price', with: '60')
    click_button('Submit')

    expect(page).to have_content 'Test home'
    expect(page).to have_content 60
  end

  scenario 'A user is able to set available dates' do
    sign_up
    click_button('Log in')
    fill_in(:username, with: 'Pablito')
    fill_in(:password, with: 'roar123')
    click_button('Log in')
    click_link('Add home')
    fill_in('name', with: 'Test home')
    fill_in('price', with: '60')
    fill_in('start_date', with: '01/02/2021')
    fill_in('end_date', with: '04/02/2021')
    click_button('Submit')
    click_button('Check Availability')
    expect(page).to have_content '01/02/2021'
    expect(page).to have_content '02/02/2021'
    expect(page).to have_content '03/02/2021'
    expect(page).to have_content '04/02/2021'
  end
end
