class ListsController < ApplicationController

  before_filter :find_list, :only => [:show, :edit, :update]

  def index
    @lists = List.all    
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to @list, :notice => "List was successfully created."  
    else
      flash[:alert] = "List has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update_attributes(params[:list])
      redirect_to lists_path, :notice => "List has been updated."
    else
      flash[:alert] = "List has not been updated."
      render :action => "edit"
    end
  end

  private
  def find_list
    @list = List.find(params[:id])  
  end
end