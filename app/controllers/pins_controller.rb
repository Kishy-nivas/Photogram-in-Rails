class PinsController < ApplicationController
  before_action :find_pin , only: [:show,:edit,:destroy,:update]
  before_action :authenticate_user!, except: [:show,:index]

  def index 
    @pin = Pin.paginate(:page => params[:page], :per_page => 9).order('created_at DESC').includes(:user)

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

  def destroy 
    if @pin.destroy
      redirect_to pins_path 
    end 
  end 


  def user_pin 
    @user_pins = Pin.where(user_id: current_user.id)
  end



  private 
  def pin_params 
    params.require(:pin).permit(:title,:description,:image,:remote_image_url) 
  end




end
