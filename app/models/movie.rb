class Movie < ApplicationRecord
  acts_as_taggable_on :tags
  validates :title, presence: true

  belongs_to :user

  def update_watched_status
    if self.watched == true
      update_attribute(:watched, false)
    else
      update_attribute(:watched, true)
    end
  end

  def self.alphabetize_movies(user)
    where("user_id = #{user.id}")
    .order("movies.title")
  end
end
