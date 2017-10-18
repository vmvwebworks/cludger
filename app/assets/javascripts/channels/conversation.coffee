CreateConversationChannel = function(conversationId) {
  App.conversation = App.cable.subscriptions.create({
    channel: "ConversationChannel",
    roomId: conversationId
  },
  {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return $('#messages').append(data['message']);
    },
    speak: function(message, conversationId) {
      return this.perform('speak', {
        message: message,
        conversationId: conversationId
      });
    }
  });

  $(document).on('keypress', '[data-behavior~=conversation_speaker]', function(event) {
    if (event.keyCode === 13) {
      App.room.speak(event.target.value, roomId);
      event.target.value = "";
      event.preventDefault();
    }
    return $('#messages').animate({
      scrollTop: $('#messages')[0].scrollHeight
    }, 100);
  });
};
