
$('#modal-show').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var subject = button.data('subject') // Extract info from data-* attributes
  var body = button.data('body')
  var comments = button.data('comments')
  var mid = button.data('mid')
  var score = button.data('score')
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text(subject)
  modal.find('.control-label').html(body + '<br>' + comments)
  modal.find('#upvote').attr('href', '/messages/' + mid + '/upvote')
  modal.find('#downvote').attr('href', '/messages/' + mid + '/downvote')
  modal.find('#score').html(score)
})
