$(document).on("turbolinks:load", function () {
  $(".rating").raty( { path: '/assets', scoreName: 'comment[rating]' });
  $(".rated").raty({ path: "/assets",
    readOnly: true,
    score: function() {
      return $(this).attr("data-score");
    }
  });

  $(".enable-review").click( function() {
    $(".review-container").show();
  });

});