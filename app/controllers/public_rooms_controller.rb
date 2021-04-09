class PublicRoomsController < ApplicationController
    
    # def new
    #     @public_room = PublicRoom.new
    # end
    
    def create
        @public_room = PublicRoom.create(pb_room_params)
    end

    def index
        @current_user = current_user
        render 'sessions/new' unless @current_user
        @public_room = PublicRoom.new
        @public_rooms = PublicRoom.all    
    end

    def show
      @single_room = PublicRoom.find(params[:id])
      @public_rooms = PublicRoom.all
      @current_user = current_user
      @public_message = PublicMessage.new
      @public_messages = @single_room.public_messages
      render 'index'
    end

    def pb_room_params
        params.require(:public_room).permit(:name)
    end


end
