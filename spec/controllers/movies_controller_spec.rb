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
end