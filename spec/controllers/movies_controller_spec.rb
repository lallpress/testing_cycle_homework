require 'rails_helper'

describe MoviesController do
    describe 'update a movie with a director' do
       it 'should modify the movie attributes' do
           movie = FactoryGirl.create(:movie)
           put :update, {:id => movie.id, :movie => {:director => 'Ridley Scott'}}
           movie.reload
           expect(movie.director).to eq('Ridley Scott')
       end
    end
    
    describe 'find movies with the same director' do
       it 'should accept a director to search for' do
           movie = FactoryGirl.create(:movie, :director => 'Edgar Wright')
           Movie.should_receive(:more_movies_by_director).with('Edgar Wright')
           
           get :more, {:id => movie.id}
       end
       
       it 'should return movies with the given director' do
           movie_1 = FactoryGirl.create(:movie, :director => 'Edgar Wright')
           movie_2 = FactoryGirl.create(:movie, :director => 'Edgar Wright')
           movie_3 = FactoryGirl.create(:movie, :director => 'Joss Whedon')
           mock_movies = [movie_1, movie_2]
           
           get :more, {:id => movie_1.id}
           expect(assigns(:movies)).to match_array(mock_movies)
       end
    end
end