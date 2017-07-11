class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.more_movies_by_director(director)
    return Movie.where(:director => director)
  end
end
