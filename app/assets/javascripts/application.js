// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require_tree .

$(function(){
	function readURL(input){
		if (input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#board_img_prev').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#board_image").change(function(){
		readURL(this);
	});
});

$(function previewImage() {
	const target = this.event.target;
	const file = target.files[0];
	const reader  = new FileReader();
	reader.onloadend = function () {
		const preview = document.querySelector("#preview")
		if(preview) {
			preview.src = reader.result;
		}
	}
	if (file) {
		reader.readAsDataURL(file);
	}
});

