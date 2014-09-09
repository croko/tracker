class Task < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  enum status: [:opened, :in_progress, :closed]

end
