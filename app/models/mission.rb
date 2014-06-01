class Mission < ActiveRecord::Base
  belongs_to :user, touch: true

  validates :text, presence: true
end
