class ResidentsController < ApplicationController
  before_action :set_floor, only: [:index]
  before_action :update_floor, only: [:update]

  def index
  end

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)
    if @resident.save
      redirect_to root_path, notice: '入居者様を新たに登録しました'
    else
      render :new
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    @resident = Resident.find(params[:id])
    if @resident.update(resident_params)
      redirect_to root_path, notice: '入居者を更新しました'
    else
      render :edit
    end
  end

  private

  def resident_params
    params.require(:resident).permit(:name, {floor_ids: []}).merge(user_id: current_user.id)
  end

  def set_floor
    @floor = Floor.find(params[:floor_id])
  end

  def update_floor
    @floor = Floor.where(floor_id: params[:floor_id])
  end
end