class VetsController < ApplicationController
  before_action :set_vet, only: [:show]

  def index
    @vets = Vet.includes(appointments: :pet)
  end

  def show
  end

  private

  def set_vet
    @vet = Vet.includes(appointments: :pet).find(params[:id])
  end
end