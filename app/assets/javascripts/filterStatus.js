function filterStatus(){
$("#movie_filter_status").on('change', function() {
    var $movies = $('.movie');
    var filterChoice = this.value;
    $movies.each(function(index, movie) {
      $movie = $(movie);
      if ( $movie.data("status") === filterChoice) {
        $movie.show();
      } else if ( filterChoice === "All" ){
        $movie.show();
      } else {
        $movie.hide();
      }
    });
  });
}
