class Role < ActiveRecord::Base
  has_and_belongs_to_many :user, touch: true
end
