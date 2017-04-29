$finish_image_edit = $('image_update').find('#finish_image_edit');
$finish_image_update = $('.image_update').find('.finish_image_update');

$(document).ready(function(){
	$finish_image_edit.on('click', deleteGORImagesSetForDeletion(), function(){
			finish_image_update.remove();
	});

	$('#edit_some_images').on('click', function(e){
		append_destroy_links('#edit_some_images', '#images');
		if ($finish_image_update.html('')){
			$finish_image_update.append(xhr.res + " | "); 
			// escape_javascript(render('images/_images_finish_edit'
		}	
	});
	
	$('i.icon-destroy-link').on('click', function(e){
		$(this).addClass('set-for-deletion');
	});
});

var deleteGORImagesSetForDeletion = function(){
	$.ajax({
		type: 'DELETE',
		url: '/admin/gor_clothing/:id/images',
		data: {
			destroy_link_icons: document.getElementsByClassName('icon-destroy-link'),
			collateral_images: $('i.set-for-deletion').siblings('#images_<%= image.type_of_image %>'),
			collateral_images_parent: $('.collateral_images').has('i').hasClass('set-for-deletion') //All Elements with ClassName collateral-images and set-for-deletion
		},
		context: collateral_images_parent,
		// binding.pry,
		success: function(evt, data, status, xhr){
				 new Effect.Parallel([
    					new Effect.Move($(this), { sync: true, x: 400, y: 0, mode: 'relative' }), 
    					new Effect.Opacity($(this), { sync: true, from: 1, to: 0 })
  				], { 
    					 duration: 1.5
  				});
				$(this).remove();
		}
	});
};