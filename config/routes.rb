

  Rails.application.routes.draw do


    devise_for :users, controllers: { registrations: 'users/registrations' }
    get("/backdoor", { :controller => "forms", :action => "add_form" })
    root to: "forms#index"
    # get("/", { :controller => "forms", :action => "index" })
    post("/add_update", {:controller => "forms", :action => "add_task"})
    get("/setup", {:controller => "forms", :action => "add_setup"})
    post("/setup", {:controller => "forms", :action => "setup"})
  end
  
  
  # rails generate model Task status:numeric
  # rails db:migrate
  
  
  # rails generate model Habitlog Habit1Minutes:binary Habit2Minutes:binary Motivation:text
  # rails db:migrate
  
# rails generate migration AddUserIdToHabitlogs user_id:integer
