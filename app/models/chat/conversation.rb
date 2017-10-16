class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :users
  has_many :messages
  field :type, type: String
  def participate?(user)
    user_ids.include?(user.id)
  end
end
