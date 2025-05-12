class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
    @medical_records = @patient.medical_records # 患者の診療記録を取得
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "患者情報を登録しました。"
    else
      flash.now[:alert] = "登録に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "患者情報を更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: "患者情報を削除しました。"
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :patient_code, :last_name, :first_name, :last_name_kana, :first_name_kana,
      :date_of_birth, :gender, :blood_type, :postal_code, :address, :phone_number,
      :email, :insurance_number, :insurance_type, :emergency_contact_name,
      :emergency_contact_phone, :memo, :status, :user_id
    )
  end
end