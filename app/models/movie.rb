class Movie < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  def self.send_movie_email(movie_params)
    if movie_params['title'].include?('cc')
      UserNotifierMailer.send_movie_email(movie_params['title'].split(' ')[2], movie_params['title'].split(' ')[0]).deliver_now
    end
  end
end
