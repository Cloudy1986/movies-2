feature 'View Movies' do
  scenario 'user can view a list of movies' do
    connection = PG.connect(dbname: 'movie_database_test')
    connection.exec("INSERT INTO movies (title) VALUES ('The Godfather');")
    connection.exec("INSERT INTO movies (title) VALUES ('Scarface');")
    connection.exec("INSERT INTO movies (title) VALUES ('Goodfellas');")
    
    visit '/'
    click_link 'See Movies'
    
    expect(page).to have_content('Movie List')
    expect(page).to have_content('The Godfather')
    expect(page).to have_content('Scarface')
    expect(page).to have_content('Goodfellas')
  end
end
