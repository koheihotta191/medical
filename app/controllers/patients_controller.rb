class PatientsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @patient = Patient.new
  end
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: '患者情報が登録されました'
    else
      render :new
    end
  end
  def show
    @patient = Patient.find(params[:id])
    @medical_records = @patient.medical_records
  end
  def edit
    @patient = Patient.find(params[:id])
  end
  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patient_path(@patient), notice: '患者情報が更新されました'
    else
      render :edit
    end
  end

  def index
    @patients = Patient.all
  end


  private

  def patient_params
    params.require(:patient).permit(
      :last_name, :first_name, :birth_date,
      :phone_number, :email, :address,
      :emergency_contact, :medical_record_number
    )
  end
end

