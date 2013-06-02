class ListsController < ApplicationController

  def index
    
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    @list.save
    redirect_to @list, :notice => "List was successfully created."  
  end

  def show
    
  end
end
