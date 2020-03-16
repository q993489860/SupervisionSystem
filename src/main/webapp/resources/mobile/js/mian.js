$(document).ready(function(){
	$('#toggle-btn').on('click',function(){
		$('#time-box').toggle();
	});
	$("#search-toggle").on('click',function(){
		$('#time-box').hide();
	})
})