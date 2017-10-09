class ConversationUserDetail
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :conversation
  belongs_to :user
  field :permission,  type: String, default: "common"
end
