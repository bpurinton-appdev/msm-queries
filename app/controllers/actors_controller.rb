class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({ :template => "actor_templates/index" })
  end

  def view_actor
    @id = params.fetch("actor_id")
    d = Actor.where({ :id => @id }).at(0)
    @name = d.name
    @dob = d.dob
    @bio = d.bio
    @image = d.image
    @created = d.created_at
    @updated = d.updated_at

    @list_of_characters = Character.where({ :actor_id => @id })

    render({ :template => "actor_templates/actor_page" })
  end
  
end
