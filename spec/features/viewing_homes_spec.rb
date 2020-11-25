feature 'viewing index page' do
  scenario 'can see homes to rent' do
    visit('/homes')

    expect(page).to have_content 'Homes to rent'
  end
end
