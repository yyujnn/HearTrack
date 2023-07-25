// AdminEcg 페이지에서 정보 가져오는 페이지
jQuery(document).ready(function($) {
	'use strict';

	// Notification list
	if ($(".notification-list").length) {

		$('.notification-list').slimScroll({
			height: '250px'
		});

	}

	// Menu Slim Scroll List
	if ($(".menu-list").length) {
		$('.menu-list').slimScroll({

		});
	}

	// Sidebar scrollnavigation 

	if ($(".sidebar-nav-fixed a").length) {
		$('.sidebar-nav-fixed a')
			// Remove links that don't actually link to anything

			.click(function(event) {
				// On-page links
				if (
					location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') &&
					location.hostname == this.hostname
				) {
					// Figure out element to scroll to
					var target = $(this.hash);
					target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
					// Does a scroll target exist?
					if (target.length) {
						// Only prevent default if animation is actually gonna happen
						event.preventDefault();
						$('html, body').animate({
							scrollTop: target.offset().top - 90
						}, 1000, function() {
							// Callback after animation
							// Must change focus!
							var $target = $(target);
							$target.focus();
							if ($target.is(":focus")) { // Checking if the target was focused
								return false;
							} else {
								$target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
								$target.focus(); // Set focus again
							};
						});
					}
				};
				$('.sidebar-nav-fixed a').each(function() {
					$(this).removeClass('active');
				})
				$(this).addClass('active');
			});

	}

	// tooltip
	if ($('[data-toggle="tooltip"]').length) {

		$('[data-toggle="tooltip"]').tooltip()

	}

	// popover
	if ($('[data-toggle="popover"]').length) {
		$('[data-toggle="popover"]').popover()

	}
	// Chat List Slim Scroll
	if ($('.chat-list').length) {
		$('.chat-list').slimScroll({
			color: 'false',
			width: '100%'
		});
	}




}); // AND OF JQUERY




var doc = document.documentElement;
// 전체화면 설정
function openFullScreenMode() {
	if (doc.requestFullscreen)
		doc.requestFullscreen();
	else if (doc.webkitRequestFullscreen) // Chrome, Safari (webkit)
		doc.webkitRequestFullscreen();
	else if (doc.mozRequestFullScreen) // Firefox
		doc.mozRequestFullScreen();
	else if (doc.msRequestFullscreen) // IE or Edge
		doc.msRequestFullscreen();
	$('.fullscreen').hide();
	$('.close-fullscreen').show();
}
// 전체화면 해제
function closeFullScreenMode() {
	if (document.exitFullscreen)
		document.exitFullscreen();
	else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
		document.webkitExitFullscreen();
	else if (document.mozCancelFullScreen) // Firefox
		document.mozCancelFullScreen();
	else if (document.msExitFullscreen) // IE or Edge
		document.msExitFullscreen();
	$('.fullscreen').show();
	$('.close-fullscreen').hide();
}








