$(document).ready(function() {
    // "다시 보기" 링크의 클릭 이벤트를 처리합니다.
    $(".viewAgainLink").on("click", function(e) {
        e.preventDefault();
        var ecgNum = $(this).data("ecg-id");
        

        $.ajax({
            url: "getEcgDetails",
            type: "GET",
            data: { ecg_id: ecgNum },
            success: function(data) {
                // 서버에서 받은 데이터를 JavaScript 객체로 가공합니다.
                var ecgData = data[0];
                console.log(data)
                
                var inputDate = new Date(ecgData.input_date);
                var formattedDate = inputDate.toLocaleDateString("ko-KR", { year: "2-digit", month: "2-digit", day: "2-digit" });
                

                // 모달 본문을 동적으로 생성합니다.
                var modalBodyHtml = `
                    <div class="ECG_record">
                        <h4 class="subtitle2">${formattedDate} ECG 검사 결과</h4>
                        <div class="col-sm-9">
                             <img class="ECG_record_IMG" src="/ht/image/${ecgData.image_name}.png" />  
                        </div>
                        <div class="col-sm-3 ECG_Result">
                            <table class="ecg_result_table">
                                <th>${ecgData.user_id}님</th>
                                <th><span style="color: rgb(255, 118, 140);">♥ </span> ${ecgData.hr}bpm</th>
                            </table>
                            <br>
                            <table class="ecg_result_table">
                                <thead>
                                    <tr>
                                        <th>내용</th>
                                        <th>결과</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td>검사날짜</td>
                                    <td>${formattedDate}</td>
                                </tr>
                                <tr>
                                    <td>검사결과</td>
                                    <td><span class="${ecgData.cssClass}">● </span> ${ecgData.resultsText}</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><span> </span></td>
                                </tr>
                                <tr>
                                    <td>PR interval</td>
                                    <td><span>${ecgData.pr} </span>ms</td>
                                </tr>
                                <tr>
                                    <td>QRS duration</td>
                                    <td><span>${ecgData.qrs} </span>ms</td>
                                </tr>
                                <tr>
                                    <td>QT interval</td>
                                    <td><span>${ecgData.qt} </span>ms</td>
                                </tr>
                                <tr>
                                    <td>QTc interval</td>
                                    <td><span>${ecgData.qtc} </span>ms</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><span> </span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                `;

                // 모달 본문에 동적으로 생성한 HTML 코드를 삽입합니다.
                $("#ecgModal .modal-body").html(modalBodyHtml);
                
                // 모달을 보여줍니다.
                $("#ecgModal").modal("show");
            },
            error: function(xhr, status, error) {
                console.error("ECG 정보를 가져오는 중 오류가 발생했습니다:", error);
            }
        });
    });
});
