require 'database_helpers'

feature 'booking a home' do
  scenario 'user can book a home' do
    sign_up
    log_in
    click_link('Add home')
    fill_in('name', with: 'Test home')
    fill_in('price', with: '60')
    fill_in('start_date', with: '01/02/2021')
    fill_in('end_date', with: '01/02/2021')
    click_button('Submit')
    click_button('Check Availability')
    click_button('Book')
    expect(page).to have_content "We've approved your booking."
  end
end
