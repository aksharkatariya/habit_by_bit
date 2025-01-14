class FormsController < ApplicationController
  def index
    @habit = current_user.habitlogs
    render({ :template => "forms_templates/home" })
  end

  def add_form
    render({:template => "forms_templates/backdoor"})
  end

  def add_setup
    render({:template => "forms_templates/setup"})
  end

  def add_task
    h = Habitlog.new
    h.Habit1Minutes = params.fetch("task1_param")
    h.Habit2Minutes = params.fetch("task2_param")
    h.Motivation = params.fetch("motivation_param")
    h.user_id = current_user.id
    h.save
    redirect_to("/")
  end 

    def setup
      # Get the current user
      @user = current_user
      @habit_one = current_user.habit_one
      @habit_two = current_user.habit_two
  
      # Update the user with form data
      if @user.update(
           habit_one: params[:habit1_param], 
           habit_two: params[:habit2_param]
         )
        flash[:notice] = "Your habits have been saved successfully!"
        redirect_to ("/backdoor") # Redirect to a desired page after submission
      else
        flash[:alert] = "There was an error saving your habits."
        render :setup # Render the setup page again with errors
      end
    end
    
  end

  


