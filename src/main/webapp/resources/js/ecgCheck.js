const uploadArea = document.getElementById('uploadArea');
const fileNameElement = document.getElementById('fileName');
let fileInput;
let selectedFile = null; // 변수를 추가하여 선택한 파일을 저장합니다.

uploadArea.addEventListener('click', function() {
  if (!fileInput) {
    fileInput = document.getElementById('fileLabel');
    fileInput.addEventListener('change', function() {
      const files = this.files;
      setSelectedFile(files[0]); // 파일 선택 시에 선택한 파일을 저장합니다.
    });
  }

  // fileInput.click();
});

uploadArea.addEventListener('dragover', function(e) {
  e.preventDefault();
  this.classList.add('drag-over');
});

uploadArea.addEventListener('dragleave', function() {
  this.classList.remove('drag-over');
});

uploadArea.addEventListener('drop', function(e) {
  e.preventDefault();
  this.classList.remove('drag-over');

  const files = e.dataTransfer.files;
  setSelectedFile(files[0]); // 파일 선택 시에 선택한 파일을 저장합니다.
});

function setSelectedFile(file) {
  selectedFile = file;
  showFileName(file);
}

function handleFileUpload() {
  if (selectedFile) {
    console.log('Selected file:', selectedFile);

    const formData = new FormData();
    formData.append('file', selectedFile);
    formData.append('fileName', selectedFile.name); // 파일 이름 추가

    for (var key of formData.keys()) {
    }
    for (var value of formData.values()) {
    }

    send(formData);
  }
}

function send(formData) {

  $.ajax({
    type: 'POST',
    url: 'upload',
    data: formData,
    processData: false,
    contentType: false,
    success: function(response) {
      console.log('AJAX 요청 성공:', response);
      
      const fileName = response.fileName;
      const fileExtension = response.fileExtension;
      const user_id = response.user_id;

      // 추출한 파일 이름과 확장자 값을 확인합니다.
      console.log('Flask 서버로부터 받은 파일 이름:', fileName);
      console.log('Flask 서버로부터 받은 파일 확장자:', fileExtension);
      console.log('Flask 서버로부터 받은 파일 유저아이디:', user_id);
      
	 $.ajax({
	    type: 'POST',
	    url: 'http://127.0.0.1:9000/upload', // Flask 서버의 주소와 엔드포인트로 변경해주세요
	    data: {
	      fileName: fileName,
	      fileExtension: fileExtension,
	      user_id : user_id
	    },
	    success: function(response) {
	      console.log('Flask로부터 받은 응답:', response);
		    if (response.status === 'success') {
	          console.log('Flask 서버 처리 성공');
	          window.location.href = 'ecgResult';
	        }
	    },
	    error: function(xhr, status, error) {
	      console.log('AJAX 요청 오류:', error);
	    }
	  });
      
    },
    error: function(xhr, status, error) {
    }
  });
}

function showFileName(file) {
  if (file) {
    fileNameElement.innerHTML = `<span class="upload-area-title">${file.name}</span>`;
  } else {
    fileNameElement.innerHTML = '<span class="upload-area-title">드래그해서 파일을 올려주세요</span>';
  }
}

// 전송 버튼 클릭 이벤트를 추가합니다.
const submitButton = document.getElementById('submit-btn');
submitButton.addEventListener('click', function() {
  handleFileUpload();
});
