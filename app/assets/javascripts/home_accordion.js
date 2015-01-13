$(function(){
	$('#notifications-box .panel-heading.title').click(function(ev){
		$(this).parent().find('.collapse').collapse('toggle');
	});
})