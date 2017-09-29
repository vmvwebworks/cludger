class Message
  extend ActiveJob
  include Mongoid::Document
  field :content, type: String
  after_create do |document|
    puts "esto lo hace"
    document = document.to_json
    puts document
    MessageBroadcastJob.perform_later(document)
  end
end
