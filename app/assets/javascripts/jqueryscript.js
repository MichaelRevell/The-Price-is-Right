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
	if ($('.winorlose:contains("wrong")').length > 0) {
		var num = Math.ceil(Math.random()*4)
		jQuery('audio:eq(0)').attr('src', 'assets/crowdsad'+num+'.mp3');
		$('audio').get(0).play();

		var num = Math.ceil(Math.random()*4)
		jQuery('audio:eq(1)').attr('src', 'assets/wrong'+num+'.mp3');
		$('audio').get(1).play();
	};
	if ($('.winorlose:contains("right")').length > 0) {
		var num = Math.ceil(Math.random()*4)
		jQuery('audio:eq(0)').attr('src', 'assets/crowdapplause' +num+'.mp3');
		$('audio').get(0).play();

		var num = Math.ceil(Math.random()*3);
		jQuery('audio:eq(1)').attr('src', 'assets/correct'+num+'.mp3');
		$('audio').get(1).play();
		//$('audio').get(1).attr('src','assets/crowdapplause.mp3').play();
	};

	if (window.location.href.indexOf("win") == -1) { //new game
		var num = Math.ceil(Math.random()*3);
		jQuery('audio:eq(0)').attr('src', 'assets/intro'+num+'.mp3');
		$('audio').get(0).play();

		jQuery('audio:eq(1)').attr('src', 'assets/crowdintro.mp3');
		$('audio').get(1).play();

		$('.currentgame').delay(2000).fadeIn('slow');
		$('.bottom-cards').delay(2000).fadeIn('slow');

	} else { //already running game

		$('.lastgame').delay(0).fadeIn('fast');
		$('.lastgame').delay(3000).fadeOut('slow');

		$('.currentgame').delay(3500).fadeIn('slow');
		$('.bottom-cards').delay(3500).fadeIn('slow');

		setTimeout(TimeOut, 3500);

		function TimeOut() {
			//alert('lol');
			var num = Math.ceil(Math.random()*3);
			jQuery('audio:eq(1)').attr('src', 'assets/start'+num+'.mp3');

			$('audio').get(1).play();
		}

	};
	//$('.currentgame').attr('display')
	//$('.itempic').delay(1000).fadeIn('slow');

});