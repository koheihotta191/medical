class MedicalRecordsController < ApplicationController
  load_and_authorize_resource

  def index
    @patient = Patient.find(params[:patient_id])
    @medical_records = @patient.medical_records.order(date: :desc)
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @medical_record = @patient.medical_records.build
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @medical_record = @patient.medical_records.build(medical_record_params)
    if @medical_record.save
      redirect_to patient_medical_records_path(@patient), notice: '診療記録を登録しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @medical_record = @patient.medical_records.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @medical_record = @patient.medical_records.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @medical_record = @patient.medical_records.find(params[:id])
    
    if @medical_record.update(medical_record_params)
      redirect_to patient_medical_record_path(@patient, @medical_record), notice: '更新しました。'
    else
      render :edit
    end
  end

  private

  def medical_record_params
    params.require(:medical_record).permit(:date, :symptoms, :doctor_comment)
  end
end