class TasksController < ApplicationController

  before_filter :find_list
  before_filter :find_task, :only => [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to [@list, @task], :notice => "Task has been updated."  
    else
      flash[:alert] = "Task has not been updated."
      render :action => :edit
    end
  end

  private
  def find_list
    @list = List.find(params[:list_id]) 
  end

  def find_task
    @task = @list.tasks.find(params[:id])  
  end
end
