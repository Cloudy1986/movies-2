feature 'View Movies' do
  scenario 'user can view a list of movies' do
    visit '/'
    click_link 'See Movies'
    expect(page).to have_content('Movie List')
    expect(page).to have_content('The Godfather')
    expect(page).to have_content('Scarface')
    expect(page).to have_content('Goodfellas')
  end
end
