class Admin::MessagesController < ApplicationController

  def index
    @messages = Message.all
  end
  def edit
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to request.referer
  end
end
