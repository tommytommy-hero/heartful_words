class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @message = Message.new
    @tags = Tag.all
    @messages = @user.messages
  end

  def edit
  end
end
