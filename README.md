# Movie Vault

## LIVE in production at [LIVE Heroku link](https://glacial-retreat-21796.herokuapp.com/)

MovieVault is a small application for saving movies you might want to watch again or later.

We build out a rails application that allows:
an unauthenticated user to:
* log in or sign up

 an authenticated user to:
  * sign up
  * log in and sign out
  * submit and view movies
  * update movie status with options to "Mark as Watched" and "Mark as Unwatched" without reloading the page
  * edit movies after they have added some to my MovieVault when viewing movies index
  * mark a movie as watched or unwatched without reloading page
  * filter list of movies by search term as I type
  * click buttons/links to filter list by status("watched" and "unwatched")
  * sort the list alphabetically

  Supporting features

  ## Installation
  * `git clone https://github.com/deborahleehamel/movie_vault.git`
  *  cd movie_vault
  * `bundle`
  * `rake db:create db:migrate`

  ## To run in Development
  * `rails s`
  * Go to [http://localhost:3000](http://localhost:3000) in your browser.

  ## Testing
  * rspec
