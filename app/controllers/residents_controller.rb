class ResidentsController < ApplicationController
  before_action :set_floor, only: [:index, :update]

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
      render :index
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    @resident = Resident.find(params[:id])
    @floor = Floor.find(params[:id])
    if @resident.update(resident_params)
      redirect_to floor_resident_records_path(@floor, @resident), notice: '入居者を更新しました'
    else
      render :edit
    end
  end

  private

  def resident_params
    params.require(:resident).permit(:name, {floor_ids: []}).merge(user_id: current_user.id)
  end

  def set_floor
    @floor = Floor.where(floor_id: params[:floor_id])
  end
end