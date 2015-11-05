
$('#modal-show').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var subject = button.data('subject') // Extract info from data-* attributes
  var body = button.data('body')
  var mid = button.data('mid')
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text(subject)
  modal.find('#mid').text(mid)

$.ajax({
     type: "GET",// GET in place of POST
     contentType: "application/json; charset=utf-8",
     url: "http://localhost:3000/",
     data : JSON.stringify({name:"ravi",age:"31"}),
     dataType: "json",
     success: function (result) {
        //do somthing here
        window.alert("success!!");
     },
     error: function (){
        window.alert("something wrong!");
     }
});

})
