feature 'Homepage' do
  scenario 'user can view the hompage' do
    visit '/'
    expect(page).to have_content('Welcome to Movie Manager')
  end
end
