function updateStatus(){
  $('.watched').on("click", function(event){
    var button = event.target;
    //grab id of button
    var movieId = button.getAttribute('id');
    $.ajax({
      method: "PATCH",
      url: "/api/v1/movies/update_watched_status",
      data: { id: movieId },
      dataType: "json",
      success: function(movie){
        updateButtonText(movie, button);
        updateRowColor(movie, button);
      }
    });
  });
}

function updateButtonText(movie, button){
  if (movie.watched === true) {
    button.innerText = "Mark as Unwatched";
  } else {
    button.innerText = "Mark as Watched";
  }
}

function updateRowColor(movie, button){
  var row = button.parentElement.parentElement;
  if (movie.watched === true) {
    row.setAttribute("data-status", "Watched");
    row.style.backgroundColor= "lightgray";
  } else {
    row.setAttribute("data-status", "Unwatched");
    row.style.backgroundColor = "lightgreen";
  }
}
