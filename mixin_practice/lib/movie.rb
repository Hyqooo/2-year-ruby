class Movie 
  attr_reader :title, :imdb, :kinopoisk, :metacritic, :rotten_tomatoes
  def initialize(title, imdb, kinopoisk, metacritic, rotten_tomatoes)
    @title = title
    @imdb = imdb
    @kinopoisk = metacritic
    @rotten_tomatoes = rotten_tomatoes    
  end

  def ogon_rating=(rating)
    @ogon_rating = rating
  end
end