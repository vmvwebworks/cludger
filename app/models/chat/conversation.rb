class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :conversation_users
  has_many :messages through: :conversation_users
  # def participate?(user)
  #   user_ids.include?(user.id)
  # end
end
