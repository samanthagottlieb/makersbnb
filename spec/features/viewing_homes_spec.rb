feature 'viewing index page' do
  scenario 'there are no homes to see' do
    visit('/homes')

    expect(page).to have_content 'Test home'
  end
end
