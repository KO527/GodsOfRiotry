function append_destroy_links(id_clicked_on, targetElement){
	$(id_clicked_on).bind("ajax.success", function(event, data){
		$(data).each(function(){
			if (targetElement == '#possible_matches')
				$("<%= escape_javascript(render('possible_matches/destroy')) %>").insertBefore(targetElement + '_' + this.id);
			else if (targetElement == '#gor_clothing_images')
				$("<%= escape_javascript(render('images/destroy'))%>").insertBefore(targetElement + '_' + this.id);
		});
	});
}
$('document').ready(function(){
	$('#edit_possible_matches').on('click', function(e){
		append_destroy_links('#edit_possible_matches', '#possible_matches');
	});
	$('#edit_some_images').on('click', function(e){
		append_destroy_links('#edit_some_images', '#gor_clothing_images');
	});
	$('i.icon-destroy-link').on('click', function(e){
		$(this).addClass('set-for-deletion');
	});

	$('#Finish_Edit').on('click', deleteSetForDeletion, function(){
		$("<%= escape_javascript(render('images/_images_finish_edit')) %>").detach();
	});
	// $('#new_piece').prompt some new file pop_up window
});

var deleteSetForDeletion = function(){
	$.ajax({
		type: 'DELETE',
		url: '/admin/gor_clothing/:id/images',
		data: {
			destroy_link_icons: document.getElementsByClassName('icon-destroy-link'),
			collateral_images: $('i.set-for-deletion').siblings('#gor_clothing_images_<%= gor_clothing.id %>'),
			collateral_images_parent: $('.collateral_images').has('i.set-for-deletion') //All Elements with ClassName collateral-images and set-for-deletion

		},
		success: function(data){
			$(data).each(function(){
				$(this).Squish();
				$(this).remove();
			});
		}	//remove 
		// error: function(data){
		// }
	});
};