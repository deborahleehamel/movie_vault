function alphabetizeMovies() {
  $("#sort-alpha-button").on('click', function() {
    $.ajax({
      method: "GET",
      url: "/api/v1/movies/alphabetize_movies",
      success: function(alphabetizedMovies) {
         $('tbody').empty();
         $.each(alphabetizedMovies, function(index, movie) {
          var movieHtmlElement = $("<tr><td>" + movie.title + "</td> <td> "+ movie.note + "</td> <td>" + movie.watched +"</td> </tr>");
           $('tbody').append(movieHtmlElement);
         });
      }
    });
  });
}
