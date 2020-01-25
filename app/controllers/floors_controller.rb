class FloorsController < ApplicationController

  def new
    @floor = Floor.new
  end
 
  def create
    @floor = Floor.new(floor_params)
    if @floor.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def floor_params
    params.require(:floor).permit(:name)
  end
end
