CreateConversationChannel = (conversationId) ->
  App.conversation = App.cable.subscriptions.create channel: "ConversationChannel", roomId: conversationId,
    connected: ->
    disconnected: ->
    received: (data) ->
      $('#messages').append data['message']
    speak: (message, conversation_id)->
      @perform 'speak', message: message, conversation_id: conversation_id
     $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
      if event.keyCode is 13 # return/enter = send
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()
