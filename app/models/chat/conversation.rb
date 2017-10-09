class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :users
  has_many :messages
  has_many :conversation_user_details
  field :created_at, type: Time, default:


  # def participates(user)
  #   user_id.exists?(user.id)
  # end
end
