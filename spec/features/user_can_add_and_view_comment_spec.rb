feature 'Add and View comments' do
  scenario 'user can add and view comments' do
    visit '/movies'
    click_link 'Add Movie'
    fill_in 'title', with: 'The Power of the Dog'
    click_button 'Submit'
    expect(current_path).to eq '/movies'
    expect(page).to have_content 'Movie List'
    expect(page).to have_content 'The Power of the Dog'

    click_button 'Add comment'
    fill_in 'comment_text', with: 'This film is going to win some Oscars'
    click_button 'Submit'
    expect(current_path).to eq '/movies'
    expect(page).to have_content 'Movie List'
    expect(page).to have_content 'The Power of the Dog'
    expect(page).to have_content 'This film is going to win some Oscars'
  end
end
