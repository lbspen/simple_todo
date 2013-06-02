class ListsController < ApplicationController

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
    @list = List.find(params[:id])  
  end
end
