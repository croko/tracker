class Task < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  enum status: [:opened, :in_progress, :closed]

end
