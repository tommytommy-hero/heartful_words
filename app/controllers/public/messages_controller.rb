class Public::MessagesController < ApplicationController

  def new
  end

  def create
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :name, :tag_id)
  end
end
