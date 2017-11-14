class ConversationUser
  include Mongoid::Document
  belongs_to :user
  has_many :messages
  field :conversation_id, type: String
  def conversation
    Conversation.find(conversation_id)
  end
end
