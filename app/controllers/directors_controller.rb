class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index" })
  end

  def director_old
    @director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first
    render({ :template => "director_templates/eldest" })
  end

  def director_young
    @director = Director.where.not({ :dob => nil }).order({ :dob => :desc }).first
    render({ :template => "director_templates/youngest" })
  end

  def new_director
    name = params.fetch("input_name")
    dob = params.fetch("input_dob")
    bio = params.fetch("input_bio")
    image = params.fetch("input_image")
    
    d = Director.new
    d.name = name
    d.dob = dob
    d.bio = bio
    d.image = image
    d.save
    
    render({ :template => "director_templates/index" })
  end

  def view_director
    @id = params.fetch("director_id")
    d = Director.where({ :id => @id }).at(0)
    @name = d.name
    @dob = d.dob
    @bio = d.bio
    @image = d.image
    @created = d.created_at
    @updated = d.updated_at
    render({ :template => "director_templates/bio_page" })
  end
  
end
