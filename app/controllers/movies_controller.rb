class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    render({ :template => "movie_templates/index" })
  end

  def view_movie
    @id = params.fetch("movie_id")
    d = Movie.where({ :id => @id }).at(0)
    @title = d.title
    @year = d.year
    @duration = d.duration
    @description = d.description
    @image = d.image
    @director = Director.where({ :id => d.director_id }).at(0).name
    @created = d.created_at
    @updated = d.updated_at

    render({ :template => "movie_templates/movie_page" })
  end
  
end
