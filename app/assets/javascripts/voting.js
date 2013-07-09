// <%- vote_count = @debate_side.votes.count %>
// var votes = <%= vote_count %>;
// var id = '<%= "votes-#{@debate_side.side}" %>';
// $("#" + id).text(votes);

$(document).ready(function() {
  $("#vote-form-no").on('submit', getVotes);
  $("#vote-form-yes").on('submit', getVotes);
});

function getVotes(event) {
  event.preventDefault();

  var $form = $(event.target);

  var data = $form.serialize();
  var actionUrl = $form.attr('action') + ".json";

  // $.post(actionUrl, data, {
  //   success: handleCreateVoteSuccess
  // });

  $.ajax({
    type: "POST",
    url: actionUrl,
    data: data,
    success: handleCreateVoteSuccess,
    dataType: "json"
  });
}

function handleCreateVoteSuccess(data, textStatus, xhr) {
  updateVotes(data);
}

function updateVotes (data) {
  var vote_count = data.vote_count;
  if (vote_count != null) {
    var id = "votes-" + data.side;
    $("#" + id).text(vote_count);
  }
  else {
    $("#notice").text('You are not allowed to vote right now!');
  }
}
