class ConversationController < ApplicationController
  def show
    @messages = Message.all
  end
end
