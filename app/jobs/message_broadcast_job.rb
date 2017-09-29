class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    puts "al perform del job llega"
    #ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end
  def render_message(message)
    puts "al render_message llega"
    #ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end
