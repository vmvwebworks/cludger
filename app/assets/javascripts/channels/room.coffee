App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # alert("bienvenido")
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (message, conversation_id)->
    @perform 'speak', message: message, conversation_id: conversation_id

   $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
     if event.keyCode is 13 # return/enter = send
       App.room.speak event.target.value
       event.target.value = ''
       event.preventDefault()
