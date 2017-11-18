class PinsController < ApplicationController
  before_action :find_pin , only: [:show,:edit,:destroy,:update]
  def index 
    @pin = Pin.all.order("updated_at DESC")
  end
  
  def new
    @pin = current_user.pins.new 
  end

  def create
    @pin = current_user.pins.new(pin_params) 
    if @pin.save 
      redirect_to @pin,notice: "created succesfully"
    else
      render :new
    end
  end


  def show
  end

  def find_pin 
    @pin = Pin.find(params[:id])
  end
  
  def edit 
  end 

  def update
    if @pin.update(pin_params)
      redirect_to @pin ,notice: "Edit saved succesfully"
    else 
      render :edit 
      end  
  end 

  def user_pin 
    @user_pins = Pin.find(current_user.id)
  end


  private 
  def pin_params 
    params.require(:pin).permit(:title,:description)
  end




end
