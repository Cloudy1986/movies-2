feature 'Add Movie' do
  scenario 'user can add a movie and it is displayed in the movie list' do

    visit '/'
    click_link 'See Movies'
    click_link 'Add Movie'
    fill_in 'title', with: 'Platoon'
    click_button 'Submit'

    expect(page).to have_content('Platoon')

  end
end
