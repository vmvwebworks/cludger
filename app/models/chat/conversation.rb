class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :users
  has_many :messages
  has_many :conversation_user_details
  def participate?(user)
    user_ids.include?(user.id)
  end
  # def participates(user)
  #   user_id.exists?(user.id)
  # end
end
