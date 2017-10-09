class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :timeoutable, omniauth_providers: [:google_oauth2]
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
  def contacts
    User.find(contact_list) do |contact|
      puts "dame el nombre de un contacto ijueputa"
      puts contact.name
    end
  end
  #has_and_belongs_to_many :organizations
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
  field :contact_list,       type: Array

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
end
