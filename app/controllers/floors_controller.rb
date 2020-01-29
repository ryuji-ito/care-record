class FloorsController < ApplicationController
  before_action :move_to_index, except: [:index]

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
      render :index
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
    @floor = Floor.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
