class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @message = Message.new
    @tags = Tag.all
    @messages = @user.messages.order(created_at: :desc).page(params[:page])
  end

  def edit
  end
end
