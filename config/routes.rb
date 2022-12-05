Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/youngest", { :controller => "directors", :action => "director_young" })
  get("/directors/eldest", { :controller => "directors", :action => "director_old" })
  get("/directors/:director_id", { :controller => "directors", :action => "view_director" })
  get("/insert_director", { :controller => "directors", :action => "new_director" })
end
