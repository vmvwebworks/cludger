class Message
  extend ActiveJob
  include Mongoid::Document
  field :content, type: String
  after_create do |document|
    puts "esto lo hace"
    puts document.content
    MessageBroadcastJob.perform_later(document)
  end
end
