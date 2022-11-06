class Public::MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.save
    redirect_to user_path(current_user)
  end

  def edit
    @message = Message.find(params[:id])
    @tags = Tag.all
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to request.referer
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :text, :tag_id)
  end
end
