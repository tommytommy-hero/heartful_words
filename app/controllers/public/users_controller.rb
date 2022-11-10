class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @message = Message.new
    @tags = Tag.all
    @messages = @user.messages.order(created_at: :desc).page(params[:page])
  end

  def edit
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:message_id)
    @messages = Message.where(id: favorites).order("RANDOM()").limit(1)
  end
end
