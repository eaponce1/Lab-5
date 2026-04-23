class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]

  # INDEX 
  def index
    @appointments = Appointment.upcoming.includes(:pet, :vet)
  end

  # PAST 
  def past
    @appointments = Appointment.past.includes(:pet, :vet)
    render :index
  end

  def show
  end

  private

  def set_appointment
    @appointment = Appointment.includes(:pet, :vet).find(params[:id])
  end
end