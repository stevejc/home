jQuery(function($){
	$("#thumbnails li a").click(function(e){
		e.preventDefault();
		$("#full li").hide();
		var href= $(this).attr("href")
		$(href).show();
		
	});
	
	$("#full li").hide();
	$("#full li").first().show();
	
});

