class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  # INDEX 
  def index
    @pets = Pet.includes(:owner)
  end

  # SHOW 
  def show
  end

  private

  def set_pet
    @pet = Pet.includes(:owner).find(params[:id])
  end
end