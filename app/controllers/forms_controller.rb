class FormsController < ApplicationController
  def index
    @habit = Habitlog.all
    
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
    h.save
    redirect_to("/")
  end

  

end
