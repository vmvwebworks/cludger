class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{current_user.id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    conversation = Conversation.find_by(id: data['conversation_id'])
    if conversation && conversation.participates?(current_user)
      personal_message = current_user.messages.build({body: data['message']})
      personal_message.conversation = conversation
      personal_message.save
    end
    Message.create content: data['message']
  end
end
