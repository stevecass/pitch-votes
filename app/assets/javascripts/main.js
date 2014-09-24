$(document).ready(function(){

  $('form.new_pitch').on('submit', function(event){
  	event.preventDefault();
  	var target_url = $(event.target).attr('action');
  	$.ajax(target_url, {
  		method: 'post',
  		dataType: 'text',
  		data: $(event.target).serialize()
  	}).done(function(data){
  		$('table#pitches').append(data);
  		$('form.new_pitch').trigger('reset');
  	}).fail(function(data){
  		console.log(data)

  	});
  });

  var removeIntended = false;
  $('.sortable').sortable({
    
    over: function(event, ui) { removalIntended = false; },
    out:  function(event, ui) { removalIntended = true; },
    beforeStop: function(event, ui) {
      if (removalIntended) {
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

  $('table#votes').tablesorter();

  $('a[data-purpose="select-all"]').on('click', function(event){
    event.preventDefault();
    $('.pitch_cb').prop('checked', true);
  })

  $('a[data-purpose="clear-all"]').on('click', function(event){
    event.preventDefault();
    $('.pitch_cb').prop('checked', false);
  })

})

