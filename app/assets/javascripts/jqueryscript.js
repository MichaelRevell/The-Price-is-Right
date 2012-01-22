$(document).ready( function() {

	//when the user hovers over the div that contains our html...
	$('.box_container').hover( function() {
		//... we get the width of the div and split it by 2  ...
		var width = $(this).outerWidth() / 2;
		/*... and using that width we move the left "part" of the image to left and right "part"
		 to right by changing it's indent from left side or right side... '*/
		$(this).find('.left').animate({
			right : width
		}, {
			queue:false,
			duration:300
		});
		$(this).find('.right').animate({
			left : width
		}, {
			queue:false,
			duration:300
		});
	}, function() {
		//... and when he hovers out we get the images back to their's starting position using the same function... '
		// $(this).find('.left').animate({ right : 0 },{queue:false,duration:300});
		//$(this).find('.right').animate({ left : 0 },{queue:false,duration:300});
		//... close it and that's it
	});
	if ($('.winorlose:contains("lose")').length > 0) {
		var num = Math.floor(Math.random()*4)
		jQuery('audio:eq(0)').attr('src', 'assets/crowdsad'+num+'.mp3');
		$('audio').get(0).play();

	}
	if ($('.winorlose:contains("win")').length > 0) {
		var num = Math.floor(Math.random()*4)
		jQuery('audio:eq(0)').attr('src', 'assets/crowdapplause' +num+'.mp3');
		$('audio').get(0).play();

		//$('audio').get(1).attr('src','assets/crowdapplause.mp3').play();
	}
});