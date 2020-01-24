class FloorsController < ApplicationController

  def new
    @floor = Floor.new
    @floor.users << current_user
  end

  def create
  end
  
end
