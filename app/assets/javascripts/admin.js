function append_destroy_links(id_clicked_on, targetElement){
	$(id_clicked_on).bind("ajax.success", function(event, data){
		$(data).each(function(){
			("<%= escape_javascript(render('/destroy')) %>").insertBefore(targetElement + '_' + this.id);
		});
	});
}
$('document').ready(function(){
	$('#edit_possible_matches').on('click', function(e){
			append_destroy_links('#edit_possible_matches', '#possible_matches_');
	});
	$('#edit_some_images').on('click', function(e){
			append_destroy_links('#edit_some_images', '#gor_clothing_images_');
	});
});