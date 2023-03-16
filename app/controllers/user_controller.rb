class UserController < ApplicationController
  def show

    @user = User.find(params[:id])

    #As an owner
    @owner = @user.as_owner
    @rooms = @owner.rooms

    # Adding guest and room names to stays, and sorting by user name. Using join to avoid many calls to DB
    @unbilled_stays = 
      @owner.stays.unbilled.includes(:guest, :room).group_by {|s| s.guest.name}
        
    #As a guest
    @guest = @user.as_guest
    @rooms_available = Room.available - @owner.rooms    
  end

  def checkin
  end

  def checkout
  end

  def create_room
  end
end
