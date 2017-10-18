def subscribed
    stream_from "conversation_channel_#{params[:conversationId]}"
  end

  def speak(data)
     Message.create! text: data['message'], conversation_id: data['conversationId']
  end
