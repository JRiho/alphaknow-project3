// 열기버튼
$(function () {
    // 품목리스트 열기
    $(".show_item_list").off("click").on("click", function () {
        // ajax
        $.ajax({
            url: '/alphaknow/receivingManagement/ajax.doSelect', // 요청할 URL
            type: 'GET', // 요청 방식 (GET)
            dataType: 'json', // 응답 데이터 타입 (JSON)
            success: function(data) {
                console.log('data:', data);
                // 여기서 응답 데이터를 활용하여 필요한 작업 수행
                let listTableTbody = $(".item_list_table tbody")
                // 전에 썼던거 초기화
                listTableTbody.find("tr").remove();
                // 그다음 작업 실행
                for(let i=0; i<data.length; i++) {
                    // 보유량이 없으면 0으로 표시
                    if(data[i].PRODUCT_AMOUNT == undefined) {
                        data[i].PRODUCT_AMOUNT = 0;
                    }
                    let htmlString = `<tr>
                                        <input type="hidden" value="${data[i].COMPANY_AND_PRODUCT_TEMP_SEQ}"
                                            class="captseq">
                                        <input type="hidden" value="${data[i].COMPANY_SEQ}"
                                            class="companySeq">
                                        <th>${i+1}</th>
                                        <th><input type="checkbox" class="selectItemList"></th>
                                        <td>${data[i].PRODUCT_CODE} <input type="hidden" value="${data[i].PRODUCT_CODE}"
                                            class="itemListCode">
                                        </td>
                                        <td>${data[i].PRODUCT_NAME} <input type="hidden" value="${data[i].PRODUCT_NAME}"
                                            class="itemListName">
                                        </td>
                                        <td>${data[i].COMPANY_NAME} <input type="hidden" value="${data[i].COMPANY_NAME}"
                                            class="itemListCompany">
                                        </td>
                                        <td>${data[i].PRODUCT_PRICE} <input type="hidden" value="${data[i].PRODUCT_PRICE}" class="itemListPrice">
                                        </td>
                                        <td>${data[i].PRODUCT_AMOUNT} <input type="hidden" value="${data[i].PRODUCT_AMOUNT}"
                                            class="itemListCurrentAmount">
                                        </td>
                                      </tr>`;
                    listTableTbody.append(htmlString);
                }
                


            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때 처리할 콜백 함수
                console.error('AJAX 오류:', status, error);
            }
        });
        $(".item_list_wrap").show();
    })

    // 입고신청서 작성 열기
    $(".show_request_item").off("click").on("click", function () {
        // 선택된 전체 거래처명을 담을 배열
        let selCompanyNames = [];
        // 선택된 체크박스의 거래처명 배열에 담기
        let selectedTr = $(".selectItemList:checked").parent().parent()
        for (let i = 0; i < selectedTr.length; i++) {
            console.log($(selectedTr[i]).find(".companySeq").val())
            selCompanyNames.push($(selectedTr[i]).find(".companySeq").val())
        }
        console.log(selCompanyNames)


        // 배열 내 값이 모두 같은지 비교
        // every 메서드는 배열 내의 모든 요소가 주어진 조건을 만족할 때 true를 반환함
        let isAllEqual = selCompanyNames.every(function (selCompanyName) {
            return selCompanyNames[0] === selCompanyName
        })
        console.log(isAllEqual)

        // 만약 모두 같고 (isAllEqual == true) 하나만 선택한 경우 입고신청서 작성창 오픈
        if ((isAllEqual && selCompanyNames.length > 0) || selCompanyNames.length == 1) {
            $(".request_item_wrap").show();

            // 열린 이후에 신청서에 값 담기
            // 신청일은 오늘 날짜로 자동 기입
            // 현재 날짜와 시간을 가져와서 지정된 형식으로 포맷팅하는 함수
            function getCurrentDateTime() {
                let currentDate = new Date();
                let year = currentDate.getFullYear();
                let month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
                let day = currentDate.getDate().toString().padStart(2, '0');
                let hours = currentDate.getHours().toString().padStart(2, '0');
                let minutes = currentDate.getMinutes().toString().padStart(2, '0');
                let seconds = currentDate.getSeconds().toString().padStart(2, '0');

                let formattedDateTime = [];
                let formattedDateTimeSpacing = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
                let formattedDateTimeNoSpacing = year + month + day + hours + minutes + seconds;

                formattedDateTime.push({formattedDateTimeSpacing: formattedDateTimeSpacing,
                                        formattedDateTimeNoSpacing: formattedDateTimeNoSpacing})
                return formattedDateTime;
            }
            // 신청일에 자동 기입하기
            let currentDateTime = getCurrentDateTime();
            $("#requestDateTd").text(currentDateTime[0].formattedDateTimeSpacing);
            $("#requestDate").val(currentDateTime[0].formattedDateTimeSpacing);
            // 거래번호 <input hidden tradecode>
            $("#tradecode").val("TC" + currentDateTime[0].formattedDateTimeNoSpacing);
            


            // 담당자 & 거래처주소는 아작스로 가져오기
            $.ajax({
                url: '/alphaknow/receivingManagement/ajax.doSelect2?company_seq='+selCompanyNames[0],
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log('data:', data);
                    
                    // JSON 데이터를 활용하여 필요한 작업 수행
                        // 거래처명 자동 기입
                        $("#companyNameTd").text(data[0].COMPANY_NAME);
                        $("#companyName").val(data[0].COMPANY_NAME);
                    for (let i = 0; i < data.length; i++) {
                        console.log('data[i].COMPANY_EMPLOYEE:', data[i].COMPANY_EMPLOYEE);
                        console.log('data[i].ADDRESS:', data[i].ADDRESS);
                        // 필요한 데이터를 추출하여 활용
                        $("#companyEmployeeTd").text(data[i].COMPANY_EMPLOYEE);
                        $("#companyEmployee").text(data[i].COMPANY_EMPLOYEE);
                        $("#companyAddrTd").text(data[i].ADDRESS);
                        $("#companyAddr").text(data[i].ADDRESS);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX 오류:', status, error);
                }
            });


            // 품목코드, 품목명, 단가 자동기입
            for (let i = 0; i < selectedTr.length; i++) {
                // 계산식 미리 생성해서 data-price로 넣기
                let itemPrice = parseFloat($(selectedTr[i]).find(".itemListPrice").val());
                // 각 행을 동적으로 생성하여 tbody에 추가
                let htmlString = `
                    <tr>
                        <input type="hidden" name="captseq" value="${$(selectedTr[i]).find(".captseq").val()}">
                        <td>
                            ${$(selectedTr[i]).find(".itemListCode").val()}
                            <input type="hidden" name="itemCode" class="itemCode">
                        </td>
                        <td>
                            ${$(selectedTr[i]).find(".itemListName").val()}
                            <input type="hidden" name="itemName" class="itemName">
                        </td>
                        <td>
                            <input type="number" name="itemAmount" class="itemAmount" data-price="${itemPrice}">
                        </td>
                        <td>
                            ${$(selectedTr[i]).find(".itemListPrice").val()}
                            <input type="hidden" name="itemPrice" class="itemPrice">
                        </td>
                        <td class="itemAllPrice">
                            
                        </td>
                    </tr>
                `;

                // 생성된 행을 tbody에 추가
                $(".request_item_table_tbody").append(htmlString);
            }

            // 아이템 수량 입력하면 자동으로 총 금액 입력
            $(".itemAmount").off("input").on("input", function () {
                let itemAmount = parseFloat($(this).val());
                let price = parseFloat($(this).data("price"));
                let itemAllPrice = itemAmount * price;
                console.log(itemAmount);
                console.log(price);
                console.log(itemAllPrice);
                // NaN 생기는거 방지
                if (isNaN(itemAmount) || $(".itemAmount").val() == undefined || isNaN(price)) {
                    $(this).parent().parent().find(".itemAllPrice").text("");
                } else {
                    $(this).parent().parent().find(".itemAllPrice").html(itemAllPrice + '<input type="hidden" name="itemAllPrice" value="'+itemAllPrice+'">')
                }
            })
        } else if (selCompanyNames.length == 0) {    // 하나도 선택하지 않았으면
            alert("입고하려는 품목이 하나 이상 존재해야 합니다.")
        } else {
            alert("입고신청하려는 거래처가 모두 같아야 합니다.")
        }

        // 체크박스 체크 해제
        $(".item_list_wrap").find("input[type='checkbox']").prop("checked", false);

    })
})

// 닫기버튼
$(function () {
    // 품목리스트 닫기
    $(".close_item_list").off("click").on("click", function () {
        $(".item_list_wrap").hide();
        // 체크박스 체크 해제
        $(".item_list_wrap").find("input[type='checkbox']").prop("checked", false);
    })
    // 입고신청서 작성 닫기
    $(".close_request_item").off("click").on("click", function () {
        $(".request_item_wrap").hide();

        // 입고신청서의 리스트를 초기화함.
        $(".request_item_table_tbody").children().remove();
    })
})

// 입고신청목록 체크박스 이벤트
$(function () {
    // 전체선택 체크박스가 클릭되었을 때
    $("#selectAllRequestList").click(function () {
        // 전체선택 체크박스의 상태에 따라 하위 체크박스들의 상태 변경
        $(".selectRequestList").prop('checked', $(this).prop('checked'));
    });

    // 하위 체크박스 중 하나라도 변경되었을 때
    $(".selectRequestList").click(function () {
        // 전체선택 체크박스의 상태 변경
        if (!$(this).prop('checked')) {
            // 하위 체크박스 중 하나라도 해제되었을 경우 전체선택 체크박스 해제
            $("#selectAllRequestList").prop('checked', false);
        } else {
            // 모든 하위 체크박스가 선택되었을 경우 전체선택 체크박스 선택
            if ($(".selectRequestList:checked").length === $(".selectRequestList").length) {
                $("#selectAllRequestList").prop('checked', true);
            }
        }
    });
});

// 품목리스트 체크박스 이벤트
$(function () {
    // 전체선택 체크박스가 클릭되었을 때
    $("#selectAllItemList").click(function () {
        // 전체선택 체크박스의 상태에 따라 하위 체크박스들의 상태 변경
        $(".selectItemList").prop('checked', $(this).prop('checked'));
    });

    // 하위 체크박스 중 하나라도 변경되었을 때
    $(".selectItemList").click(function () {
        // 전체선택 체크박스의 상태 변경
        if (!$(this).prop('checked')) {
            // 하위 체크박스 중 하나라도 해제되었을 경우 전체선택 체크박스 해제
            $("#selectAllItemList").prop('checked', false);
        } else {
            // 모든 하위 체크박스가 선택되었을 경우 전체선택 체크박스 선택
            if ($(".selectItemList:checked").length === $(".selectItemList").length) {
                $("#selectAllItemList").prop('checked', true);
            }
        }
    });
});



// 입고신청목록 td 클릭이벤트
$(function() {
    $(".receiving_management_list_table tbody").find("td").off("click").on("click", function() {
        console.log("클릭")
        // 거래번호 선택
        let tradeCode = $(this).parent().find("input[type='hidden']").val()
        console.log(tradeCode)
        // 모든 값이 담긴 input hidden값 중에 data-tradeCode가 같은것 고르기
        let detailInfo = [];
        $("input[data-tradecode='" + tradeCode + "']").each(function() {
            // json형식으로 저장
            detailInfo.push({
                            tradecode : $(this).data("tradecode"), 
                            productname : $(this).data("productname"),
                            lot : $(this).data("lot"),
                            productamount : $(this).data("productamount"),
                            afterproductamount : $(this).data("afterproductamount"),
                            requestamount : $(this).data("requestamount"),
                            productprice : $(this).data("productprice"),
                            productallprice : $(this).data("productallprice")
                            })
        })
        // 데이터값 넣기
        detailTbody = $(".receiving_management_detail_table tbody")
        for(let i=0; i<detailInfo.length; i++){
            let htmlString = `
                                <tr>
                                    <th>${i+1}</th>
                                    <td>${detailInfo[i].tradecode}</td>
                                    <td>${detailInfo[i].productname}</td>
                                    <td>${detailInfo[i].lot}</td>
                                    <td>${detailInfo[i].productamount}</td>
                                    <td>${detailInfo[i].afterproductamount}</td>
                                    <td>${detailInfo[i].requestamount}</td>
                                    <td>${detailInfo[i].productprice}</td>
                                    <td>${detailInfo[i].productallprice}</td>
                                </tr>`;
            detailTbody.html(htmlString)
        }
    })
})

$(function() {
    $("#done_request_btn").off("click").on("click", function() {

        // // json 생성
        // let jsonData = {};


        // // 폼 데이터 읽기
        // let formData = new FormData(document.querySelector("#insertForm"))
        // for (const pair of formData.entries()) {
        //     console.log('?' + pair[0] + '=' + pair[1] + '&');
        // }

        let isConfirm = confirm("입고를 신청하시겠습니까?")
        if(isConfirm) {
            $("#insertForm").submit();
        }

    })
})


