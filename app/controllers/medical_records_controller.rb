class MedicalRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_medical_record, only: [:show, :edit, :update, :destroy]

  def index
    @medical_records = @patient.medical_records
  end

  def show
  end

  def new
    @medical_record = @patient.medical_records.new
  end

  def create
    @medical_record = @patient.medical_records.new(medical_record_params)
    @medical_record.doctor = current_user # 現在ログイン中の医師を担当医として設定
    if @medical_record.save
      redirect_to patient_medical_records_path(@patient), notice: "診療記録を登録しました。"
    else
      flash.now[:alert] = "登録に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @medical_record.update(medical_record_params)
      redirect_to patient_medical_records_path(@patient), notice: "診療記録を更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    @medical_record.destroy
    redirect_to patient_medical_records_path(@patient), notice: "診療記録を削除しました。"
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_medical_record
    @medical_record = @patient.medical_records.find(params[:id])
  end

  def medical_record_params
    params.require(:medical_record).permit(:visited_at, :subjective, :objective, :assessment, :plan, :notes, :diagnosis_code, :follow_up_date, :attachment)
  end
end