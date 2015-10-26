class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.save
  end

end
