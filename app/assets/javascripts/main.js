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

})