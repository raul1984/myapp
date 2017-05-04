$(document).on("turbolinks:load", function () {
  $(".image-zoom").elevateZoom({zoomWindowPosition: 10});
  $(".rating").raty( { path: '/assets', scoreName: 'comment[rating]' });
  $(".rated").raty({ path: "/assets",
    readOnly: true,
    score: function() {
      return $(this).attr("data-score");
    }
  });
});

$(".enable-review").click( function() {
    $(".review-container").show();
  });