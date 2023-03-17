class RoomsController < ApplicationController

  before_action :set_owner

  def new

    @room = @owner.rooms.build

  end

  def create

    @room = @owner.rooms.new(room_params)

    if @room.save
      redirect_to owner_dashboard_path(@owner), notice: "Room #{@room.name} was successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Message errors:"      
    end

  end

  private 

  def set_owner
    @owner = Owner.find(params[:owner_id])
  end

  def room_params
    params.require(:room).permit(:name, :price)
  end
end
