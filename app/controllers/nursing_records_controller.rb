class NursingRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_nursing_record, only: [:show, :edit, :update, :destroy]

  def index
    @nursing_records = @patient.nursing_records
  end

  def show
  end

  def new
    @nursing_record = @patient.nursing_records.new
  end

  def create
    @nursing_record = @patient.nursing_records.new(nursing_record_params)
    @nursing_record.nurse = current_user # 現在ログイン中の看護師を記録者として設定
    if @nursing_record.save
      redirect_to patient_nursing_records_path(@patient), notice: "看護記録を登録しました。"
    else
      flash.now[:alert] = "登録に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @nursing_record.update(nursing_record_params)
      redirect_to patient_nursing_records_path(@patient), notice: "看護記録を更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    @nursing_record.destroy
    redirect_to patient_nursing_records_path(@patient), notice: "看護記録を削除しました。"
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_nursing_record
    @nursing_record = @patient.nursing_records.find(params[:id])
  end

  def nursing_record_params
    params.require(:nursing_record).permit(:recorded_at, :observation, :nursing_action, :nursing_plan, :evaluation, :note, :vital_signs, :pain_scale)
  end
end