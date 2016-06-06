class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => true

  has_many :received_notes , :class_name => "Note", :foreign_key => "recipient_id"
  has_many :sent_notes , :class_name => "Note", :foreign_key => "sender_id"

  has_many :received_messages , :class_name => "Message", :foreign_key => "recipient_id"

  has_many :sent_messages , :class_name => "Message", :foreign_key => "sender_id"

end
