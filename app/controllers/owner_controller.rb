class OwnerController < ApplicationController

  before_action :set_owner

  def show

    @rooms = @owner.rooms

    # Adding guest and room names to stays, and sorting by user name. Using join to avoid many calls to DB
    @unbilled_stays = 
      @owner.stays.unbilled.includes(:guest, :room).group_by {|s| s.guest.name}
        
    @invoices = @owner.invoices.includes(:guest)

  end

  def set_invoice_as_paid
    invoice = Invoice.find(params[:invoice_id])
    @owner.set_invoice_as_paid(invoice)
    redirect_to user_path(user)
  end

  def create_room
  end

  def create_invoices
    @user = User.find(params[:user_id])
    @user.as_owner.create_invoices
    redirect_to user_path(@user)

  end

  private 

  def set_owner
    @owner = Owner.find(params[:id])
  end

end
