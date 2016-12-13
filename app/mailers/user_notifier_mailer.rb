class UserNotifierMailer < ApplicationMailer
  default from: "Movie-Pick-From-Me@lacial-retreat-21796.herokuapp.com"

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_movie_email(email, title)
    @title = title
    mail( :to => email,
    :body => @title,
    :content_type: "text/html",
    :subject => 'Movie pick just for you' )
  end
end

end
