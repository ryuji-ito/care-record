class RecordsController < ApplicationController
  before_action :set_resident

  def index
    @record = Record.new
    @records = @resident.records.includes(:user)
  end

  def create
    @record = @resident.records.new(record_params)
    if @record.save
      redirect_to floor_resident_records_path(@resident), notice: '記録を保存しました'
    else
      @records = @floor.resident.records.includes(:user)
      flash.now[:alert] = '内容と記述者名を入力してください'
      render :index
    end
  end

  private

  def record_params
    params.require(:record).permit(:content, :image, :writer_name).merge(user_id: current_user.id)
  end

  def set_resident
    @floor = Floor.find(params[:floor_id])
    @resident = Resident.find(params[:resident_id])
  end
end
