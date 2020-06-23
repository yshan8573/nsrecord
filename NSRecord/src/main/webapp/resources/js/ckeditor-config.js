
var ckeditor_config = {
	resize_enabled : false, // 에디터 리사이즈 여부
	autoUpdateElement : true, // 자동 textarea 업데이트 여부 (안됨)
	enterMode : CKEDITOR.ENTER_BR, // 에디터 엔터 <br/> 사용
	shiftEnterMode : CKEDITOR.ENTER_P, // 에디터 시프트 + 엔터 <br/> 사용
	toolbarCanCollapse : true, // 에디터 툴바 숨기기 기능 여부
	removePlugins : "elementspath", // 에디터의 플러그인을 사용하지 않을 경우 이름 입력 ( 에디터 하단 상태바에
									// 태그를 표시하는 플러그인)
	height : '160px',
	// 에디터 툴바를 설정함.
	toolbar : [
			[ 'Source', '-', 'NewPage', 'Preview' ],
			[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
			[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript',
					'Superscript' ],
			[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
			'/', [ 'Styles', 'Format', 'Font', 'FontSize' ],
			[ 'TextColor', 'BGColor' ],
			[ 'Image', 'Flash', 'Table', 'SpecialChar', 'Link', 'Unlink' ]

	]

};
