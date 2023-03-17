class RoomController < ApplicationController

  before_action :set_owner,  only: %i[ new create ]

  def new

    @room = @owner.rooms.build

  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to owner_dashboard_path(@owner), notice: "Room was successfully created."
    else
      render :new, status: :unprocessable_entity
    end

  end

  private 

  def set_owner
    @owner = Owner.find(params[:owner_id])
  end

  def room_params
    params.permit(:name, :price, :owner_id)
  end
end
