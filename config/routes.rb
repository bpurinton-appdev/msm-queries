Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:director_id", { :controller => "directors", :action => "view_director" })
  get("/insert_director", { :controller => "directors", :action => "new_director" })
end
