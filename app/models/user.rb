class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
  validates :email, presence: true, uniqueness: true, format: {with: Devise.email_regexp}

end
