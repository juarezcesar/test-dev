class GuestsController < ApplicationController

  before_action :set_guest

  def dashboard
    @rooms_available = @guest.rooms_available
  end

  def checkin
    room = Room.find(params[:room_id])
    @guest.check_in(room)    
    redirect_to guest_dashboard_path(@guest), notice: "Check in succeed"
  end

  def checkout
    stay = @guest.check_out()    
    redirect_to guest_dashboard_path(@guest), notice: "Check out succeed. Your bills is #{stay.total}"
  end

  private 

  def set_guest
    @guest = Guest.find(params[:id] || params[:guest_id])
  end

  def form_params
    params.permit(:room_id, :guest_id)      
  end

end
