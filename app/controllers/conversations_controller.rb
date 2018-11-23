class ConversationsController < ApplicationController
  SUCCESS = "You've successfully expressed an interest in the "
  ERROR = "Sorry! Something went wrong! Try again."

  def index
    # @all_sent_messages = []
    # @user_interests = policy_scope(Interest)
    # @user_interests.each do |interest|
    #   @all_sent_messages << policy_scope(Message).where(interest: interest)
    # end
    # @all_recieved_messages = []
    # @owner_interests = []
    # @owned_celestials = policy_scope(Celestial).where(user: current_user)
    # @owned_celestials.each do |celestial|
    #   @owner_interests << policy_scope(Interest).where(celestial: celestial)
    # end
    # @owner_interests.each do |interest|
    #   @all_recieved_messages << interest.messages if interest
    # end
    @conversations = policy_scope(Conversation).where(recipient: current_user) && Conversation.where(sender: current_user)
  end

  def create
    set_celestial_and_interest
    if @interest.save && @conversation.save
      redirect_to conversations_path, flash: { notice: SUCCESS + @celestial.name }
    else
      redirect_to celestial_path(interest.celestial), flash: { error: ERROR }
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
