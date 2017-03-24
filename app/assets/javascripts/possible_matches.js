$(function(){
	$("#edit_possible_matches").bind("ajax.success", function(event, data){
		$(data).each(function(){
			$('#possible_matches_' + this.id).addClass('destroy_link');
		});
	});
});