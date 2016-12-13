function updateStatus(id, status) {
  $.ajax({
    method: "PATCH",
    url: "/api/v1/movies/" + id,
    data: { id: id, watched: status},
    success: function(){
      if(status === true) {
        $("#watched-" + id).hide();
        $("#unwatched-" + id).show();
      } else {
        $("#unwatched-" + id).hide();
        $("#watched-" + id).show();
      }
    }
  });
}
