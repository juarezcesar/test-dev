class OwnerController < ApplicationController

  before_action :set_owner

  def dashboard

    @rooms = @owner.rooms

    # Adding guest and room names to stays, and sorting by user name. Using join to avoid many calls to DB
    @unbilled_stays = 
      @owner.stays.unbilled.includes(:guest, :room).group_by {|s| s.guest.name}
        
    @invoices = @owner.invoices.includes(:guest)

  end

  def set_invoice_as_paid
    invoice = @owner.invoices.find(params[:invoice_id])
    @owner.set_invoice_as_paid(invoice)
    redirect_to owner_dashboard_path(@owner)
  end

  def create_invoices
    @owner.create_invoices
    redirect_to user_dashboard_path(@owner)

  end

  private 

  def set_owner
    @owner = Owner.find(params[:id] || params[:owner_id])
  end

  def form_params
    params.permit(:invoice, :guest_id)      
  end


end
