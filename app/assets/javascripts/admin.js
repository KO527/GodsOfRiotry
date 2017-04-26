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

$finish = $('#Finish');
$finish_image_update = $('.image_update').find('.finish_image_update');
$finish_image_edit = $('image_update').find('#finish_image_edit');

$('document').ready(function(){

$('#edit_possible_matches').on('click', function(e){
		append_destroy_links('#edit_possible_matches', '#possible_matches');
		if ($finish.html('')){
			$finish.html(" | " + "<%= escape_javascript(render('possible_matches/_finish_edit')) %>");
		}
		else {
			$finish.remove();
		}
});

$('#edit_some_images').on('click', function(e){
	append_destroy_links('#edit_some_images', '#gor_clothing_images');
	if ($finish_image_update.html('')){
		$finish_image_update.html("<%= escape_javascript(render('images/_images_finish_edit'))%>" + " | ");
	}
});

$('i.icon-destroy-link').on('click', function(e){
	$(this).addClass('set-for-deletion');
});

$finish_image_edit.on('click', deleteSetForDeletion(), function(){
	finish_image_update.remove();
});

});

var deleteSetForDeletion = function(){
	$.ajax({
		type: 'DELETE',
		url: '/admin/gor_clothing/:id/images',
		data: {
			destroy_link_icons: document.getElementsByClassName('icon-destroy-link'),
			collateral_images: $('i.set-for-deletion').siblings('#images_<%= image.type_of_image %>'),
			collateral_images_parent: $('.collateral_images').has('i').hasClass('set-for-deletion') //All Elements with ClassName collateral-images and set-for-deletion
		},
		context: collateral_images_parent,
		success: function(){
				 new Effect.Parallel([
    					new Effect.Move($(this), { sync: true, x: 400, y: 0, mode: 'relative' }), 
    					new Effect.Opacity($(this), { sync: true, from: 1, to: 0 })
  				], { 
    					duration: 1.5
  				});
					$(this).remove();
				});
		};	//remove 
		// error: function(data){
		// }
};