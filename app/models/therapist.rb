class Therapist < ActiveRecord::Base
  scope :not_own_clients, lambda { |client_list| {:conditions => ['client.id NOT IN = (?)',Therapist.find(@current_user.id).clients().map.select(&:id).join(',')]} }

  attr_accessible :name, :email, :password, :password_confirmation
  has_many :clients_therapists
  has_many :clients, :through => :clients_therapists
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true, format:     { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :saved_therapies

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
