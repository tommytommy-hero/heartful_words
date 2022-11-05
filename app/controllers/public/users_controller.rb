class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @messages = @user.messages
  end

  def edit
  end
end
