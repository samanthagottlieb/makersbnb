feature 'viewing index page' do
  scenario 'displays all homes' do
    visit('/homes/new')
    fill_in('name', with: 'Test home')
    fill_in('description', with: 'Another lovely home')
    fill_in('price', with: 100)
    click_button('Submit')

    expect(page).to have_content 'Test home'
    expect(page).to have_content 100
    expect(page).to have_content 'Another lovely home'
  end
end
