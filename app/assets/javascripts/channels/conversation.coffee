App.conversation = App.cable.subscriptions.create "Conversation_#{current_user.conversation_with(contact.id).id}_Channel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (message)->
    @perform 'speak', message: message
   $(document).on 'keypress', '[data-behavior~=conversation_speaker]', (event) ->
     if event.keyCode is 13 # return/enter = send
       App.conversation.speak event.target.value
       event.target.value = ''
       event.preventDefault()
