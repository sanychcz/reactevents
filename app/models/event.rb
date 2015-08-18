class Event < ActiveRecord::Base

  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :place, presence: true

  default_scope { order('created_at DESC') }

end
