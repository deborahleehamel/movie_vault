function searchMovies(){
  $("#search-box").on("keyup", function() {
    var allSearch = this.value.toLowerCase();
    var $movies = $('.movie');
    $movies.each(function(index, movie) {
      $movie = $(movie);
      if ( $movie.children(".movie-title").text().toLowerCase().indexOf(allSearch) !== -1 ) {
        $movie.show();
      } else if ( $movie.children(".movie-note").text().toLowerCase().indexOf(allSearch) !== -1 ){
        $movie.show();
      }
      else {
        $movie.hide();
      }
    });
  });
}
