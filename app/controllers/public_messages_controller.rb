class PublicMessagesController < ApplicationController

  def create
    @current_user = current_user
    @message = @current_user.public_messages.create(content: msg_params[:content], public_room_id: params[:public_room_id])
    
    respond_to do |format|
      format.turbo_stream {
        Turbo::StreamsChannel.broadcast_replace_later_to "public_messages",  @current_user,
          target: @message,
          partial: "public_messages/public_message",
          locals: { public_message: @message, current_user: @current_user }
      }
    end
  end

  private
  def msg_params
    params.require(:public_message).permit(:content)
  end

end
