class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :messages
  field :conversation_user_ids, type: Array, default: []
end
