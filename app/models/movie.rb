class Movie < ApplicationRecord
  acts_as_taggable_on :tags
  validates :title, presence: true

  belongs_to :user
end
