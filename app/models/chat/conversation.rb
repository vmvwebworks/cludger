class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  has_many :conversation_users
  has_many :messages
  field :type, type: String
  # def participate?(user)
  #   user_ids.include?(user.id)
  # end
end
