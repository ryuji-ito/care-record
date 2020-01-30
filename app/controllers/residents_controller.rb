class ResidentsController < ApplicationController

  def index
    @floor = Floor.find_by(id: params[:id])
    @resident = @floor.residents
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
      redirect_to root_path, notice: 'フロアを更新しました'
    else
      render :edit
    end
  end

  private

  def resident_params
    params.require(:resident).permit(:name, floor_ids: []).merge(user_id: current_user.id)
  end

end