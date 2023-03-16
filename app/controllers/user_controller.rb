class UserController < ApplicationController
  def show

    @user = User.find(params[:id])

    #As an owner
    @owner = @user.as_owner
    @rooms = @owner.rooms

    # Adding guest and room names to stays, and sorting by user name. Using join to avoid many calls to DB
    @unbilled_stays = 
      @owner.stays.unbilled.includes(:guest, :room).group_by {|s| s.guest.name}
        
    @invoices = @owner.invoices.includes(:guest)


    #As a guest
    @guest = @user.as_guest
    @rooms_available = Room.available - @owner.rooms    
  end

  def set_invoice_as_paid
    user = User.find(params[:user_id])
    invoice = Invoice.find(params[:invoice_id])
    user.as_owner.set_invoice_as_paid(invoice)
    redirect_to user_path(user)
  end

  def checkin
  end

  def checkout
  end

  def create_room
  end

  def create_invoices
    @user = User.find(params[:user_id])
    @user.as_owner.create_invoices
    redirect_to user_path(@user)

  end
end
