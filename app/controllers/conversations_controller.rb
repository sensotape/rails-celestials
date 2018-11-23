class ConversationsController < ApplicationController
  SUCCESS = "You've successfully expressed an interest in the "
  ERROR = "Sorry! Something went wrong! Try again."

  def index
    @conversations = policy_scope(Conversation).where(recipient_id: current_user.id) && policy_scope(Conversation).where(sender_id: current_user.id)
  end

  def create
    set_celestial_and_interest
    if @interest.save && @conversation.save
      redirect_to conversations_path, flash: { notice: SUCCESS + @celestial.name }
    else
      redirect_to celestial_path(@celestial), flash: { error: ERROR }
    end
  end

  private

  def celestial_param
    params.require(:celestial_id)
  end

  def set_celestial_and_interest
    @celestial = Celestial.find(celestial_param.to_i)
    unless @celestial.interests.any? { |interest| interest.user == current_user }
      @interest = current_user.interests.new
      @interest.celestial = @celestial
      # authorize @interest
      @conversation = Conversation.new
      @conversation.interest = @interest
      @conversation.sender = current_user
      @conversation.recipient = @celestial.user
      authorize @conversation
    end
  end
end
