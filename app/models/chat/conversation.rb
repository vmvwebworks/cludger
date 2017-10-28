class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :messages
  field :content, type: String
  field :conversation_user_ids, type: Array
  # def conversation_user_ids
  #   ConversationUser.where(conversation_id: id)
  # end
end
