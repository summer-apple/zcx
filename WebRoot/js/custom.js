/**
 * 在这里自定义你的JS代码
 */
jQuery(document).ready(function(e) {
				jQuery("#write").click(function(){
					
					var jQuerytip = jQuery(".tip");
					var top = (jQuery(window).height() - jQuerytip.height())/2;  
		        	var left = (jQuery(window).width() - jQuerytip.width())/2;  
		       		var scrollTop = jQuery(document).scrollTop();   
		        	var scrollLeft = jQuery(document).scrollLeft();   
					
		        	jQuerytip.css( { position : 'absolute', 'top' : top + scrollTop, left : left + scrollLeft } );
					
					jQuerytip.fadeIn(750);
					
				});
});