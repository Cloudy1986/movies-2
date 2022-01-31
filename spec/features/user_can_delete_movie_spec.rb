feature 'Delete Movie' do
  scenario 'user can delete a movie' do
    visit '/movies'
    click_link 'Add Movie'
    fill_in 'title', with: 'Mission Impossible'
    click_button 'Submit'
    click_button 'Delete'
    expect(page).to have_content('Movie List')
    expect(page).not_to have_content('Mission Impossible')
  end
end
