// 입고신청 열기(품목리스트 오픈)
$(function () {
    $(".show_item_list").off("click").on("click", function () {
        // ajax
        $.ajax({
            url: '/alphaknow/receivingManagement/ajax.doSelect', // 요청할 URL
            type: 'GET', // 요청 방식 (GET)
            dataType: 'json', // 응답 데이터 타입 (JSON)
            success: function (data) {
                // 받은 데이터 표시
                console.log('data:', data);
                // 여기서 응답 데이터를 활용하여 필요한 작업 수행
                let listTableTbody = $(".item_list_table tbody")
                // 전에 썼던거 초기화
                listTableTbody.find("tr").remove();
                // 그다음 작업 실행
                for (let i = 0; i < data.length; i++) {
                    // 보유량이 없으면 0으로 표시
                    if (data[i].PRODUCT_AMOUNT == undefined) {
                        data[i].PRODUCT_AMOUNT = 0;
                    }
                    let htmlString = `<tr>
                                        <input type="hidden" value="${data[i].COMPANY_AND_PRODUCT_TEMP_SEQ}" class="itemListCompanyAndProductSeq">
                                        <input type="hidden" value="${data[i].COMPANY_SEQ}" class="itemListCompanySeq">
                                        <th>${i + 1}</th>
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
            error: function (xhr, status, error) {
                // 요청이 실패했을 때 처리할 콜백 함수
                console.error('AJAX 오류:', status, error);
            }
        });
        // 데이터값 활용 끝나고 품목리스트 창 보여주기
        $(".item_list_wrap").show();
    })
})

// 입고신청서 작성 열기
$(function () {
    $(".show_request_item").off("click").on("click", function () {
        // 거래처명이 전부 같은지 확인
        // 거래처명 담을 배열
        let companyNames = [];
        // 체크된것의 tr에서 거래처명 찾아서 배열에 담기
        let selectedboxes = $(".selectItemList:checked")
        for (let i = 0; i < selectedboxes.length; i++) {
            let companyName = $(selectedboxes[i]).closest('tr').find(".itemListCompany").val();
            companyNames.push(companyName);
        }
        // 베열에 담은 후 이름이 모두 같으면 true, 다르면 false
        let isAllSame =
            companyNames.every(function (name) {
                return name === companyNames[0]
            })

        // 하나이상 선택했고 이름이 모두 같으면 입고신청서 작성창 열기
        if (companyNames.length > 0 && isAllSame) {
            $(".request_item_wrap").show();
            // 연 후에 행동
            // 신청일 자동 기입
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

                formattedDateTime.push({
                    formattedDateTimeSpacing: formattedDateTimeSpacing,
                    formattedDateTimeNoSpacing: formattedDateTimeNoSpacing
                })
                return formattedDateTime;
            }
            // 신청일 자동 기입하기
            let currentDateTime = getCurrentDateTime();
            $("#requestDateTd").text(currentDateTime[0].formattedDateTimeSpacing);
            $("#requestDate").val(currentDateTime[0].formattedDateTimeSpacing);
            // 거래번호 <input hidden tradecode>
            $("#tradecodeTd").text("TC" + currentDateTime[0].formattedDateTimeNoSpacing);
            $("#tradecode").val("TC" + currentDateTime[0].formattedDateTimeNoSpacing);
            // 거래처명 자동 기입
            $("#companyNameTd").text($(selectedboxes[0]).closest('tr').find(".itemListCompany").val());
            $("#companyName").val($(selectedboxes[0]).closest('tr').find(".itemListCompany").val());

            // Ajax2 실행            
            $.ajax({
                url: '/alphaknow/receivingManagement/ajax.doSelect2?company_seq=' + $(selectedboxes[0]).closest('tr').find(".itemListCompanySeq").val(),
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log('data:', data);
                    // JSON 데이터를 활용하여 필요한 작업 수행
                    // 담당자 자동 기입
                    $("#companyEmployeeTd").text(data[0].COMPANY_EMPLOYEE);
                    $("#companyEmployee").text(data[0].COMPANY_EMPLOYEE);
                    for (let i = 0; i < data.length; i++) {
                        console.log('data[i].COMPANY_EMPLOYEE:', data[i].COMPANY_EMPLOYEE);
                        console.log('data[i].ADDRESS:', data[i].ADDRESS);
                        // 필요한 데이터를 추출하여 활용
                        $("#companyAddrTd").text(data[i].ADDRESS);
                        $("#companyAddr").text(data[i].ADDRESS);
                    }
                },
                error: function (xhr, status, error) {
                    console.error('AJAX 오류:', status, error);
                }
            });

            // 품목코드, 품목명, 단가 자동기입
            // 기입 전 이전 정보 제거
            $(".request_item_table_tbody").find("tr").remove()
            for (let i = 0; i < selectedboxes.length; i++) {
                // 계산식 미리 생성해서 data-price로 넣기
                let itemPrice = parseFloat($(selectedboxes[i]).closest('tr').find(".itemListPrice").val());
                // 각 행을 동적으로 생성하여 tbody에 추가
                let htmlString = `
                            <tr>
                                <input type="hidden" name="captseq" value="${$(selectedboxes[i]).closest('tr').find(".itemListCompanyAndProductSeq").val()}">
                                <td>
                                    ${$(selectedboxes[i]).closest('tr').find(".itemListCode").val()}
                                    <input type="hidden" name="itemCode" class="itemCode">
                                </td>
                                <td>
                                    ${$(selectedboxes[i]).closest('tr').find(".itemListName").val()}
                                    <input type="hidden" name="itemName" class="itemName">
                                </td>
                                <td>
                                    <input type="number" name="itemAmount" class="itemAmount" data-price="${itemPrice}">
                                </td>
                                <td>
                                    ${$(selectedboxes[i]).closest('tr').find(".itemListPrice").val()}
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
                    $(this).parent().parent().find(".itemAllPrice").html(itemAllPrice + '<input type="hidden" name="itemAllPrice" value="' + itemAllPrice + '">')
                }
            })

        } else if (companyNames.length <= 0) {
            alert("선택된 품목이 없습니다.")
        } else if (!isAllSame) {
            alert("신청하려는 품목의 거래처명이 모두 같아야 합니다.")
        }
    })
})

// td클릭시 상세보기 이벤트
$(function() {
    $(".receiving_management_list_table").find("td").off("click").on("click", function() {
        // 거래번호 가져오기
        let tradeCode = $(this).parent().find(".trade_code").val();
        console.log(tradeCode)

        // AJAX 요청 실행
        $.ajax({
            url: "/alphaknow/receivingManagement/ajax.doSelect3?trade_code="+tradeCode, // 요청할 URL
            type: "GET", // 요청 방식
            dataType: "json", // 응답 데이터 타입
            success: function(data) {
                console.log("데이터 가져오기 성공:", data);

                // 여기에 받은 데이터를 활용한 작업 수행
                // 상세 내용 동적 생성
                // 기존 내용 제거
                $(".receiving_management_detail_table tbody").find("tr").remove()
                for(let i=0; i<data.length; i++) {
                    let htmlString = 
                    `
                    <tr>
                        <th>${i+1}</th>
                        <td>${data[i].PRODUCT_CODE}</td>
                        <td>${data[i].PRODUCT_NAME}</td>
                        <td>${data[i].LOT}</td>
                        <td>${data[i].PRODUCT_AMOUNT}</td>
                        <td>${data[i].AFTER_PRODUCT_AMOUNT}</td>
                        <td>${data[i].REQUEST_AMOUNT}</td>
                        <td>${data[i].PRODUCT_PRICE}</td>
                        <td>${data[i].PRODUCT_ALL_PRICE}</td>
                    </tr>
                    `
                    // 생성 후 한줄씩 넣기
                    $(".receiving_management_detail_table tbody").append(htmlString)
                }
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때 처리할 콜백 함수
                console.error("AJAX 오류 발생:", status, error);
            }
        });
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

// 입고신청완료시 insert
$(function() {
    $("#done_request_btn").off("click").on("click", function() {

        let isConfirm = confirm("입고를 신청하시겠습니까?")
        if(isConfirm) {
            $("#insertForm").submit();
        }

    })
})

// 선택삭제시 delete
$(function() {
    $(".delete_item_list").off("click").on("click", function() {
        let isConfirm = confirm("삭제시 되돌릴 수 없습니다.\n목록을 삭제하시겠습니까?")
        if(isConfirm) {
            $("#deleteForm").submit();
        }
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
    })
    // 입고신청서 수정창 닫기
    $(".close_modify_item").off("click").on("click", function () {
        $(".modify_item_wrap").hide();
    })
})

// 각 td클릭이벤트
$(function() {
    // td 요소 클릭 시 이벤트 핸들러 등록
    $("td").on("click", function() {
        // 모든 tr 요소의 배경색을 원래대로 돌리기
        resetTableBackground();

        // 클릭한 td 요소의 부모 tr 요소 선택하여 회색 스타일 적용
        $(this).closest("tr").css("background-color", "lightgrey");
    });

    // 문서의 다른 영역(비 td 요소) 클릭 시 이벤트 핸들러 등록
    $(document).on("click", function(event) {
        // 클릭된 요소가 td 요소가 아닌 경우
        if (!$(event.target).is("td")) {
            // 모든 tr 요소의 배경색을 원래대로 돌리기
            resetTableBackground();
        }
    });

    // 모든 tr 요소의 배경색을 원래대로 돌리는 함수
    function resetTableBackground() {
        $("tr").css("background-color", "");
    }
})

// 선택수정 이벤트
$(function() {
    $(".modify_item_list").off("click").on("click", function() {
        if($(".selectRequestList:checked").length == 1) {
            console.log("하나만 선택")
            $(".modify_item_wrap").show();
            let tradeCode = $(".selectRequestList:checked").closest("tr").find(".trade_code").val();
            // Ajax
            $.ajax({
                url: "/alphaknow/receivingManagement/ajax.doSelect4?trade_code="+tradeCode,// 요청할 URL
                type: "GET", // 요청 방식
                dataType: "json", // 응답 데이터 타입
                success: function(data) {
                    console.log("데이터 가져오기 성공:", data);
    
                    // 여기에 받은 데이터를 활용한 작업 수행
                    // 공통데이터 선입력
                    $(".modify_item_table thead").find("#tradeCodeTd").text(data[0].TRADE_CODE)
                    $(".modify_item_table thead").find("#tradeDateTd").text(data[0].REQUEST_DATE)
                    $(".modify_item_table thead").find("#tradePersonTd").text(data[0].REQUEST_PERSON)


                    // 수정일 자동 기입
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

                        formattedDateTime.push({
                            formattedDateTimeSpacing: formattedDateTimeSpacing,
                            formattedDateTimeNoSpacing: formattedDateTimeNoSpacing
                        })
                        return formattedDateTime;
                    }
                    // 수정일 자동 기입하기
                    let currentDateTime = getCurrentDateTime();
                    $("#modifyDateTd").text(currentDateTime[0].formattedDateTimeSpacing);
                    $("#modifyDate").val(currentDateTime[0].formattedDateTimeSpacing);

                    // 기존주소 자동 기입하기
                    $(".modify_item_table thead").find("#oldRequestAddrTd").text(data[0].TRADE_CODE)
                    $(".modify_item_table thead").find("#oldRequestAddr").text(data[0].TRADE_CODE)
                    
                    // 거래처명 담당자 거래처주소
                    $(".modify_item_table thead").find("#companyNameTd").text(data[0].COMPANY_NAME)
                    $(".modify_item_table thead").find("#companyEmployeeTd").text(data[0].COMPANY_EMPLOYEE)
                    $(".modify_item_table thead").find("#companyAddrTd").text(data[0].COMPANY_ADDR)

                    // 기존 수정 제거
                    $(".request_item_table_tbody").find("tr").remove()
                    for(let i=0; i<data.length; i++) {
                        
                        // 각 행을 동적으로 생성하여 tbody에 추가
                        let htmlString = `
                        <tr>
                            <td>
                                ${data[i].PRODUCT_CODE}
                                <input type="hidden" name="itemCode" class="itemCode">
                            </td>
                            <td>
                                ${data[i].PRODUCT_NAME}
                                <input type="hidden" name="itemName" class="itemName">
                            </td>
                            <td>
                                <input type="number" name="itemAmount" class="itemAmount" data-price="">
                            </td>
                            <td>
                                ${data[i].PRODUCT_PRICE}
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
                            $(this).parent().parent().find(".itemAllPrice").html(itemAllPrice + '<input type="hidden" name="itemAllPrice" value="' + itemAllPrice + '">')
                        }
                    })

                    
                },
                error: function(xhr, status, error) {
                    // 요청이 실패했을 때 처리할 콜백 함수
                    console.error("AJAX 오류 발생:", status, error);
                }
            });


        } else if ($(".selectRequestList").length > 1 || $(".selectRequestList").length < 1) {
            console.log("여러개 선택")
            alert("수정은 하나씩만 가능합니다.")
        }
    })
})