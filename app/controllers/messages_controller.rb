class MessagesController < ApplicationController

  def new
    @message = current_user.messages.new
    authorize @message
  end

  def create
    @message = current_user.messages.new(permitted_attributes(Message)
    if @message.save

    else

    end

  end

  private

  current_user.interests

  @message.interest =

  def message_params
    params.require(:message).permit(:body)
  end
end
