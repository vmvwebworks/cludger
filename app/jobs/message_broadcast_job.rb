class MessageBroadcastJob < ApplicationJob
  queue_as :default
  def perform(message)
    puts "pasa por message"
    ActionCable.server.broadcast 'room_#{message.user.id}_channel', message: render_message(message), conversation_id: message.user.id
  end
  def render_message(message)
    puts "pasa por render_message"
    puts message.inspect
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end
