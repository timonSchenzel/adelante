class Colleague < ActiveRecord::Base

  attr_accessible :therapist_id, :colleague_id

  has_many :colleagues_shares

  belongs_to :therapist
  belongs_to :friend, class_name: 'Colleague', :foreign_key => 'colleague_id'

  after_create :create_inverse_relation, unless: Proc.new {
    Colleague.where(therapist_id: self.colleague_id, colleague_id: self.therapist_id).exists?
  }

  private
  def create_inverse_relation
    self.class.create!(therapist_id: self.colleague_id, colleague_id: self.therapist_id)
    puts "callback: #{self}"
  end
end
