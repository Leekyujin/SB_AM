$('select[data-value]').each(function(index, el) {
	
	const $el = $(el);
	
	const defaultValue = $el.attr('data-value').trim();
	
	if (defaultValue.length > 0) {
		$el.val(defaultValue);
	}
	
});

$('.Popup').click(function(){
	$('.layer').show();
	$('.layer-bg').show();
//	$('.layer').css('display', 'block');
});

$('.close-btn').click(function(){
	$('.layer').hide();
	$('.layer-bg').hide();
//	$('.layer').css('display', 'none');
});

/* 팝업 닫기 버튼(x) */
$('.toggle-btn').click(function() {
	$(this).toggleClass('active');
});