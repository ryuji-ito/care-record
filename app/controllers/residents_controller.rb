class ResidentsController < ApplicationController

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)
    if @resident.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :index
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    @residetn = Resident.find(params[:id])
    if @resident.update(resident_params)
      redirect_to floor_records_path(@floor), notice: 'フロアを更新しました'
    else
      render :edit
    end
  end


  private

  def resident_params
    params.require(:resident).permit(:name).merge(user_id: current_user.id)
  end

end
