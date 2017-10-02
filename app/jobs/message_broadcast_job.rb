class MessageBroadcastJob < ApplicationJob
  queue_as :default
  def perform(message)
    puts "pasa por message"
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end
  def render_message(message)
    puts "pasa por render_message"
    puts message.inspect
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end
