class TasksController < ApplicationController

  before_filter :find_list

  def new
    @task = @list.tasks.build   
  end

  def create
    @task = @list.tasks.build(params[:task])
    if @task.save
      redirect_to [@list, @task], :notice => "Task has been created."
    else
      flash[:alert] = "Task has not been created."
      render :action => :new
    end
  end

  def show
    @task = @list.tasks.find(params[:id])  
  end

  private
  def find_list
    @list = List.find(params[:list_id]) 
  end
end
