class TwilioController < ApplicationController
  def index
    @message = params[:Body]
    @sender = params[:From]
    render 'index'
  end

end
