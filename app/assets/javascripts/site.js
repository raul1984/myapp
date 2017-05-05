var refreshRating = function () {
  $(".rating").raty( { path: '/assets', scoreName: 'comment[rating]' });
  $(".rated").raty({ path: "/assets",
    readOnly: true,
    score: function() {
      return $(this).attr("data-score");
    }
  });
};

$(document).on("turbolinks:load", function () {
  refreshRating();
  
  $(".image-zoom").elevateZoom({zoomWindowPosition: 10});
  $(".enable-review").click( function() {
    $(".review-container").show();
  });
});