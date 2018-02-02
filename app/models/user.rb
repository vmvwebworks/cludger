class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :timeoutable, omniauth_providers: [:google_oauth2]

  # TODO: rewrite with has_many through:
  # TODO update: on Mongoid cannot be used throug.
  has_many :conversation_users
  ## Database authenticatable
  field :profile_image,      type: String, default: ""
  field :name,               type: String, default: ""
  field :last_name,          type: String, default: ""
  field :email,              type: String, default: ""
  field :email_verified,     type: Boolean, default: false
  field :encrypted_password, type: String, default: ""
  field :provider,           type: String, default: ""
  field :uid,                type: String, default: ""
  field :private,            type: Boolean, default: false
  field :profesional_kind,   type: String, default: ""
  field :pro_verified,       type: String, default: false

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  field :created_at,         type: Time, default: Time.now

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  #scope :contacts, -> { where(id: self.contact_list) }

  def self.from_omniauth(access_token)
    data = access_token.info
    where(provider: access_token['provider'], uid: access_token['uid']).first_or_create do |user|
      user.name = data['first_name']
      user.last_name = data['last_name']
      user.email = data['email']
      user.email_verified = true
      user.provider = access_token['provider']
      user.uid = access_token['uid']
      user.profile_image = data['image']
      user.encrypted_password = Devise.friendly_token[0,20]
    end
  end
  def conversation_ids
    conversation_list = []
    conversation_users.each do |conversation_user|
      conversation_list.push(conversation_user.conversation_id)
    end
    #conversation_list = Conversation.where(id: conversation_ids)
    conversation_list
  end
  def conversations
    Conversation.find(conversation_ids)
  end
  def start_conversation_with(user_id)
    user = User.find(user_id)
    self_conversation_user = conversation_users.new
    user_conversation_user = user.conversation_users.new
    conversation_between_users = Conversation.new
    self_conversation_user.conversation_id = conversation_between_users.id
    user_conversation_user.conversation_id = conversation_between_users.id
    conversation_between_users.conversation_user_ids = [self_conversation_user.id, user_conversation_user.id]
    self_conversation_user.save
    user_conversation_user.save
    conversation_between_users.save
    puts self_conversation_user.user.email
    puts user_conversation_user.user.email
    puts conversation_between_users.conversation_user_ids
  end
  def conversation_with(user_id)
    conversation_with_the_user_id = ""
    user = User.find(user_id)
    conversation_ids.each do |conversation_id|
      user.conversation_ids.each do |user_conversation_id|
        conversation_with_the_user_id = conversation_id if user_conversation_id == conversation_id
      end
    end
    Conversation.find(conversation_with_the_user_id)
  end
  def self.filter_with(keyword)
    users = User.search(keyword, fields: [:name])
    users.each do |user|
      puts user.name
    end
  end
end
