/**
*	Site-specific configuration settings for Highslide JS
*/
hs.graphicsDir = 'ems/css/complete/highslide/graphics/';
hs.showCredits = false;
hs.outlineType = null;
hs.fadeInOut = true;
hs.captionEval = 'this.a.title';
hs.registerOverlay({
	html: '<div class="closebutton" onclick="return hs.close(this)" title="Close"></div>',
	position: 'top right',
	useOnHtml: true,
	fade: 2 // fading the semi-transparent overlay looks bad in IE
});