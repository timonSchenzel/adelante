class Therapist < ActiveRecord::Base

  attr_accessible :name, :email, :photo, :password, :password_confirmation

  has_many :clients_therapists
  has_many :clients, :through => :clients_therapists

  has_many :therapists_therapies
  has_many :therapies, :through => :therapists_therapies

  has_many :saved_therapies

  has_many :colleagues
  has_many :friends, :through => :colleagues

  has_many :colleagues_shares

  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true, format:     { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def is_therapy_creator(therapy_id)
    self.therapists_therapies.exists?(therapy_id: therapy_id, is_creator: true)
  end

  def is_therapy_owner(therapy_id)
    self.therapies.find_by_therapy_id(therapy_id: therapy_id)
  end

  def has_therapy_saved(therapy_id)
    self.saved_therapies.exists?(therapy_id: therapy_id)
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
