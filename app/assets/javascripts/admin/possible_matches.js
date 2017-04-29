$finish = $('#Finish');

$(document).ready(function(){
	$('#edit_possible_matches').on('click', function(e){
				append_destroy_links('#edit_possible_matches', '#possible_matches');
				if ($finish.html('')){
					$finish.html(" | " + "<%= escape_javascript(render('possible_matches/_finish_edit')) %>");
				}
				else {
					$finish. remove();
				}
	});

	$('i.icon-destroy-link').on('click', function(e){
		$(this).addClass('set-for-deletion');
	});
});

var deleteGORPossMatchesSetForDeletion = function(){
	$.ajax({
		type: 'DELETE',
		url: '/admin/gor_clothing/:id/possible_matches',
		data: {
			destroy_link_icons: document.getElementsByClassName('icon-destroy-link'),
			collateral_images: $('i.set-for-deletion').siblings('#possible_match_<%= suggested_piece.id %>'),
			collateral_images_parent: $('.collateral_images').has('i').hasClass('set-for-deletion') //All Elements with ClassName collateral-images and set-for-deletion
		},
		context: collateral_images_parent,
		success: function(evt, data, status, xhr){
				 new Effect.Parallel([
    					new Effect.Move($(this), { sync: true, x: 400, y: 0, mode: 'relative' }), 
    					new Effect.Opacity($(this), { sync: true, from: 1, to: 0 })
  				], { 
    					 duration: 1.5
  				});
					$(this).remove();
				});
		};
	})
}