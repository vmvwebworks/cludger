class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :messages
  field :conversation_user_ids, type: Array, default: []
  def conversation_users
    ConversationUser.find(conversation_user_ids)
  end
  def user_ids(current_user_id)
    user_id_list = []
    conversation_users.each do |conversation_user|
      user_id_list.push(conversation_user.user.id) unless conversation_user.user.id == current_user_id
    end
    user_id_list
  end
  def user(current_user_id)
    conversation_user_id = ""
    user_ids(current_user_id).each do |user_id|
      conversation_user_id = user_id unless user_id == current_user_id
    end
    conversation_user = User.find(conversation_user_id)
    conversation_user
  end
end
