class MessagesController < ApplicationController

  SUCCESS = "You've successfully expressed an interest in the "
  ERROR = "Sorry! Something went wrong! Try again."

  def index
    @all_sent_messages = []
    @interests = policy_scope(Interest)
    @interests.each do |interest|
      @all_sent_messages << policy_scope(Message).where(interest: interest)
    end
    @all_recieved_messages = []
    @celestials = policy_scope(Celestial)
  end

  def create
    @interest = current_user.interests.new
    @interest.celestial = Celestial.find(celestial_param.to_i)
    authorize @interest
    @message = @interest.messages.new(permitted_attributes(Message)) if permitted_attributes(Message)[:body].present?
    authorize @message if @message
    make_decision(@interest, @message)
  end

  private

  def make_decision(interest, message)
    if message
      redirect_to messages_path, flash: { notice: SUCCESS + interest.celestial.name } if interest.save && message.save
    else
      if interest.save
        redirect_to celestials_path, flash: { notice: SUCCESS + interest.celestial.name }
      else
        redirect_to celestial_path(interest.celestial), flash: { error: ERROR }
      end
    end
  end

  def celestial_param
    params.require(:celestial_id)
  end
end
