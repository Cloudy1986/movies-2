feature 'Edit Movie' do
  scenario 'user can edit a movie' do

    visit '/movies'
    click_link 'Add Movie'
    fill_in 'title', with: 'Platoon'
    click_button 'Submit'

    click_button 'Edit'
    fill_in 'title', with: 'Apocalypse Now'
    click_button 'Submit'
    
    expect(page).to have_content 'Movie List'
    expect(page).not_to have_content 'Platoon'
    expect(page).to have_content 'Apocalypse Now'

  end
end
