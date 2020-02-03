class FloorsController < ApplicationController
  before_action :set_floor, only: [:index, :create]

  def index
  end

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
    @floor = Floor.find(params[:id])
  end

  def update
    @floor = Floor.find(params[:id])
    if @floor.update(floor_params)
      redirect_to floor_records_path(@floor), notice: 'フロアを更新しました'
    else
      render :edit
    end
  end

  def show
    @floors = current_user.floors
  end

  private
  def floor_params
    params.require(:floor).permit(:name).merge(user_id: current_user.id)
  end

  def set_floor
    @floor = Floor.where(floor_id: params[:floor_id])
  end
end
