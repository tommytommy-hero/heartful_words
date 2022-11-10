class Public::HomesController < ApplicationController

  def top
    @messages = Message.order("RANDOM()").limit(1)
  end
end