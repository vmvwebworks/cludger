class MessageBroadcastJob < ApplicationJob
  queue_as :default
  def perform(message)
    puts "pasa por message"
    ActionCable.server.broadcast "conversation_channel_#{message.conversation_id}", message: render_message(message)
  end

  private

  def render_message(message)
    puts "pasa por render_message"
    puts message.inspect
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end
