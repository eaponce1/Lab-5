class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # INDEX 
  def index
    @owners = Owner.includes(:pets)
  end

  # SHOW 
  def show
  end

  # NEW
  def new
    @owner = Owner.new
  end

  # CREATE
  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to @owner, notice: "Owner was successfully created."
    else
      flash.now[:alert] = "Error creating owner."
      render :new, status: :unprocessable_entity
    end
  end

  # EDIT
  def edit
  end

  # UPDATE
  def update
    if @owner.update(owner_params)
      redirect_to @owner, notice: "Owner was successfully updated."
    else
      flash.now[:alert] = "Error updating owner."
      render :edit, status: :unprocessable_entity
    end
  end

  # DESTROY
  def destroy
    @owner.destroy
    redirect_to owners_path, notice: "Owner was successfully deleted."
  end

  private

  # SET OWNER 
  def set_owner
     @owner = Owner.includes(:pets).find(params[:id])
  end

  # STRONG PARAMETERS
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone, :address)
  end
end