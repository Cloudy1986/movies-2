feature 'Add and View comments' do
  scenario 'user can add and view comments' do
    movie = Movie.create(title: 'The Power of the Dog')
    visit '/movies'
    expect(page).to have_content 'Movie List'
    expect(page).to have_content 'The Power of the Dog'

    click_button 'Add comment'
    fill_in 'comment_text', with: 'This film is going to win some Oscars'
    click_button 'Submit'
    expect(current_path).to eq "/movies/#{movie.id}/comments"
    expect(page).to have_content 'Comments'
    expect(page).to have_content 'The Power of the Dog'
    expect(page).to have_content 'This film is going to win some Oscars'
  end

  scenario 'user can navigate to comments' do
    movie = Movie.create(title: 'The Daughter')
    Comment.create(text: 'This is a comment on this film' , movie_id: movie.id)
    Comment.create(text: 'This is another comment on this film' , movie_id: movie.id)
    
    visit '/movies'
    expect(page).to have_content 'Movie List'
    expect(page).to have_content 'The Daughter'
    click_button 'View comments'
    expect(current_path).to eq "/movies/#{movie.id}/comments"
    expect(page).to have_content 'The Daughter'
    expect(page).to have_content 'This is a comment on this film'
    expect(page).to have_content 'This is another comment on this film'
  end
end
