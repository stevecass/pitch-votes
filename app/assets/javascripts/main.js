$(document).ready(function(){

  $('form.new_pitch').on('submit', function(event){
  	event.preventDefault();
  	var target_url = $(event.target).attr('action');
  	$.ajax(target_url, {
  		method: 'post',
  		dataType: 'text',
  		data: $(event.target).serialize()
  	}).done(function(data){
  		console.log(data)
  		$('table#pitches').append(data);
  	}).fail(function(data){
  		console.log(data)

  	});
  });


  $('.sortable').sortable({

    over: function(event, ui) { window.candidateSortableInside = 1; },
    receive: function(event, ui) {window.candidateSortableInside = 1; },
    out:  function(event, ui) {window.candidateSortableInside = 0; },
    beforeStop: function(event, ui) {
      if (window.candidateSortableInside == 0) {
        ui.item.remove();
      }
    }
  });

  $('.sortable').disableSelection();


  $('[data-purpose="cast-ballot"]').on('click', function() { 
    var chosen = []
    $("#candidate_list li").each(function(index, ele) {
      chosen.push($(ele).attr('data-cand-id'));
    })
    $('input#votes').val(chosen.join(','));
    $('form#the_vote_form').submit();

  })
})

