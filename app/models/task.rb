class Task < ActiveRecord::Base
  belongs_to :user, touch: true

  validates :name, presence: true

  has_many :schedules, dependent: :destroy
end
