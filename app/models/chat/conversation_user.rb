class ConversationUser
  include Mongoid::Document
  belongs_to :user
  belongs_to :conversation
  has_many :messages
  field :role,      type: String
end
