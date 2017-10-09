class Message
  extend ActiveJob
  include Mongoid::Document
  include GlobalID::Identification
  include Mongoid::Timestamps
  belongs_to :conversation
  field :author, type: String
  field :content, type: String
  after_create do |document|
    MessageBroadcastJob.perform_later(document)
  end
end
