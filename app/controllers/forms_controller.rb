class FormsController < ApplicationController
  def index
    @habit = current_user.habitlogs
    render({ :template => "forms_templates/home" })
  end

  def add_form
    render({:template => "forms_templates/backdoor"})
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

  

end
