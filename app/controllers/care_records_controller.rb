class CareRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_care_record, only: [:show, :edit, :update, :destroy]

  def index
    @care_records = @patient.care_records
  end

  def show
  end

  def new
    @care_record = @patient.care_records.new
  end

  def create
    @care_record = @patient.care_records.new(care_record_params)
    @care_record.caregiver = current_user # 現在ログイン中の介護士を記録者として設定
    if @care_record.save
      redirect_to patient_care_records_path(@patient), notice: "介護記録を登録しました。"
    else
      flash.now[:alert] = "登録に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @care_record.update(care_record_params)
      redirect_to patient_care_records_path(@patient), notice: "介護記録を更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    @care_record.destroy
    redirect_to patient_care_records_path(@patient), notice: "介護記録を削除しました。"
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_care_record
    @care_record = @patient.care_records.find(params[:id])
  end

  def care_record_params
    params.require(:care_record).permit(
      :recorded_at, :meal_intake, :toileting, :mobility, :sleep_condition,
      :care_action, :incident_report, :note, :body_temperature
    )
  end
end