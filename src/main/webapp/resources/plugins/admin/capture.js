// capture 라는 id를 가진 a 태그를 클릭했을 때 동작하는 함수
document.getElementById('capture').addEventListener('click', function() {
	
	const dashboardWrapper = document.querySelector('.dashboard-wrapper');

	// 페이지 내용을 캡처하기 위해 html2canvas 라이브러리를 사용
	html2canvas(dashboardWrapper).then(function(canvas) {
		// 캡처된 내용을 이미지 URL로 변환
		var imgURL = canvas.toDataURL('image/png');

		// 파일로 다운로드할 때 사용할 파일 이름 설정 (예: capture.png)
		var fileName = 'capture.png';

		// Blob 객체를 생성하여 다운로드 링크 생성
		var blob = dataURItoBlob(imgURL);
		var downloadLink = window.URL.createObjectURL(blob);

		// 파일 다운로드
		var a = document.createElement('a');
		a.href = downloadLink;
		a.download = fileName;
		a.click();

		// 다운로드 후에 더 이상 사용하지 않는 URL 객체 해제
		window.URL.revokeObjectURL(downloadLink);
	});
});

// Data URI를 Blob 객체로 변환하는 함수
function dataURItoBlob(dataURI) {
	var byteString = atob(dataURI.split(',')[1]);
	var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
	var ab = new ArrayBuffer(byteString.length);
	var ia = new Uint8Array(ab);
	for (var i = 0; i < byteString.length; i++) {
		ia[i] = byteString.charCodeAt(i);
	}
	return new Blob([ab], {
		type: mimeString
	});
}