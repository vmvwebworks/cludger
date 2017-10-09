class ConversationUserDetail
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :conversation
  belongs_to :user
end
