class Message
  extend ActiveJob
  include Mongoid::Document
  include GlobalID::Identification
  field :content, type: String
  after_create do |document|
    puts "pasa por el modelo message"
  
    MessageBroadcastJob.perform_later(document)
  end
end
