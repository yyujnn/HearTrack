
$(document).ready(function () {
  console.log('로그 해보기');


  // 서버로 좋아요 여부를 확인하기 위한 Ajax 요청
  $.ajax({
    url: 'likeStatus',
    dataType: 'json',
    type: 'get',
    success: function (response) {
      console.log('like 정보 받아오기 성공')
      // 받아온 응답에 따라 좋아요 버튼 상태 설정
      console.log(response)

      // 받아온 응답에 따라 좋아요 버튼 상태 설정
      for (var i = 0; i < response.length; i++) {
        var like = response[i];
        var p_num = like.p_num;
        var likeBtn = $('.like-btn[data-p-num="' + p_num + '"]');
        likeBtn.addClass('like-active');
      }

    },
    error: function () {
      console.log('좋아요 정보 확인에 실패했습니다.');
    }
  });




  $('.like-btn').on('click', function () {
    var likeBtn = $(this);
    var p_num = parseInt(likeBtn.data('p-num'));
    var likes = parseInt($('#like-count-' + p_num).text().split(' ')[1]);

    // +1 또는 -1 값 설정
    var action = likeBtn.hasClass('like-active') ? -1 : 1;

    likeBtn.toggleClass('like-active');
    likes += likeBtn.hasClass('like-active') ? 1 : -1;
    $('#like-count-' + p_num).text("좋아요 " + likes + "개");

    console.log("보내기 전 데이터 확인")
    console.log('p_num>>', p_num);
    console.log('likes>>', likes);
    console.log('action>>', action);



    // 좋아요 정보 서버로 전송
    $.ajax({
      url: "postLike",
      type: "post",
      dataType: 'json',
      data: { p_num: p_num, likes: likes, action: action },
      success: function (response) {
        console.log('좋아요 정보 전송에 성공했습니다.');
        console.log(response); // 전송된 응답 확인

      },
      error: function () {
        console.log('좋아요 정보 전송에 실패했습니다.');
        console.log({ "p_num": p_num, "likes": likes, "action": action });
      }


    });


  });
});

// [함수] 인풋 태그에 글씨 적으면 버튼색 변경
function inputReview(p_num) {
  var commentInput = document.getElementById("comment-input-" + p_num);// 게시글번호해당하는 input칸선택
  var commentButton = document.getElementById("comment-button-" + p_num); // 버튼 선택
  if (commentInput.value.length > 0) {// 한 자라도 입력이 되었으면
    commentButton.style.color = "rgb(11, 159, 228)"; // 버튼 컬러 바꾸기
  } else {
    commentButton.style.color = "rgb(199, 235, 245)";
  }
}









