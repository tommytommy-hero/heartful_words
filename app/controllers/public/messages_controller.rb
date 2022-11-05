class Public::MessagesController < ApplicationController

  def new
    @message = Message.new
    @tags = Tag.all
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to user_path(current_user)
    else
      @tags = Tag.all
      render "new"
    end
  end

  def edit
    @message = Message.find(params[:id])
    @tags = Tag.all
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
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
