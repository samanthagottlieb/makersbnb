feature 'Adding a new home' do
  scenario 'A user can add a home to the list' do
    visit('/')
    click_link('Add home')
    fill_in('name', with: 'Test home')
    click_button('Submit')

    expect(page).to have_content 'Test home'
  end
end