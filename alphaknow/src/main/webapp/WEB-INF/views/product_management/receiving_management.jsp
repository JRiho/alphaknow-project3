<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
/* 입고관리 */
.receiving_management_header {
	font-size: 30px;
	font-weight: bold;
}

/* 입고신청목록, 상세 */
.receiving_management_list_header, .receiving_management_detail_header {
	font-size: 20px;
	font-weight: 500;
	padding-top: 20px;
}

/* 입고관리와 입고신청목록의 약간의 여백 */
.receiving_management_list_container {
	padding-top: 10px;
	min-height: 350px;
}

/* 전체,결제대기,결재완료,반려 & 입고신청,선택삭제 버튼 양 옆으로 배치 */
.receiving_management_list_buttonset_container {
	display: flex;
	justify-content: space-between;
}

/* 입고신청, 선택삭제 버튼 양 옆으로 배치 */
.receiving_management_list_buttonset1,
	.receiving_management_list_buttonset2 {
	display: flex;
}

/* 각 div 간격 벌리기 */
.receiving_management_list_buttonset1>div {
	border: 1px solid red;
	padding: 0px 5px;
}

.receiving_management_list_buttonset2>div {
	padding: 0px 5px;
}

/* 전체,결제대기,결재완료,반려 & 입고신청,선택삭제 버튼과 날짜, 선택날짜조회의 약간의 여백  */
.date_search_set {
	padding-top: 10px;
}

/* 날짜조회와 입고신청한 목록 테이블의 약간의 여백 */
.receiving_management_list_table_container, /*상세(글자)와 상세 테이블의 약간의 여백 */
	.receiving_management_detail_table_container,
	/* 품목리스트 글자와 검색창의 약간의 여백 */ .item_list_buttonset2 {
	padding-top: 5px;
}

/* 테이블의 넓이 */
.receiving_management_list_table, .receiving_management_detail_table {
	width: 97%;
}

/* 품목리스트 전체 넓이 */
.item_list_wrap, /* 입고신청서 전체 넓이 */ .request_item_wrap {
	width: 80%;
	/* 테두리 */
	border: 1px solid red;
	/* 처음엔 안보이기 */
	display: none;
	/* 중앙에 위치하기 */
	position: fixed;
	top: 40%;
	/* 화면 세로 중앙 정렬을 위해 top 위치를 50%로 설정 */
	left: 50%;
	/* 화면 가로 중앙 정렬을 위해 left 위치를 50%로 설정 */
	transform: translate(-50%, -50%);
	/* 요소의 중심을 화면 중앙으로 이동 */
	z-index: 10;
	/* 요소의 맨 위로 올리기 */
	background-color: white;
	/* 뒷 요소 비침 방지 */
}

/* 품목리스트와 닫기버튼 양 옆 배치 */
.item_list_buttonset1 {
	display: flex;
	justify-content: space-between;
}

/* 리스트 검색 중앙에 위치 */
.item_list_buttonset2 {
	display: flex;
	justify-content: center;
}

/* 품목리스트 테이블 div 상단에 여백 */
.item_list_table_container {
	padding-top: 10px;
}

/* 품목리스트 테이블 넓이 */
.item_list_table, /* 입고신청서 테이블 넓이 */ .request_item_table {
	width: 100%;
}

/* 입고신청서 작성 버튼 div */
.show_request_item_div, /* 입고신청서 작성완료 버튼 div */ .done_request_item_div {
	/* 상 하단 여백 */
	padding: 10px 0px;
	/* 중앙정렬 */
	display: flex;
	justify-content: center;
}

/* 입고신청서 글자랑 닫기버튼 좌우정렬 */
.request_item_buttonset {
	display: flex;
	justify-content: space-between;
}

/* 중앙구분선 */
.center_line {
	/* 상단에 여백 */
	margin-top: 30px;
	border-top: 1px solid gray;
}

/* 입고신청서 작성창 */
.request_item_table_container {
	min-height: 700px;
}
</style>
<script src="https://code.jquery.com/jquery-4.0.0-beta.min.js"></script>
<script>
    // 열기버튼
    $(function () {
        // 품목리스트 열기
        $(".show_item_list").off("click").on("click", function () {
            $(".item_list_wrap").show();
        })

        // 입고신청서 작성 열기
        $(".show_request_item").off("click").on("click", function () {
            // 선택된 전체 거래처명을 담을 배열
            let selCompanyNames = [];
            // 선택된 체크박스의 거래처명 배열에 담기
            let selectedTr = $(".selectItemList:checked").parent().parent()
            for (let i = 0; i < selectedTr.length; i++) {
                console.log($(selectedTr[i]).find(".itemListCompany").val())
                selCompanyNames.push($(selectedTr[i]).find(".itemListCompany").val())
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
            } else if (selCompanyNames.length == 0) {    // 하나도 선택하지 않았으면
                alert("입고하려는 품목이 하나 이상 존재해야 합니다.")
            } else {
                alert("입고신청하려는 거래처가 모두 같아야 합니다.")
            }

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

                let formattedDateTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
                return formattedDateTime;
            }
            // 신청일에 자동 기입하기
            var currentDateTime = getCurrentDateTime();
            $("#requestDateTd").text(currentDateTime);
            $("#requestDate").val(currentDateTime);
            // 거래처명 자동 기입
            $("#companyNameTd").text(selCompanyNames[0]);
            $("#companyName").val(selCompanyNames[0])
            // 담당자 & 거래처주소는 아작스로 가져오기

            // 품목코드, 품목명, 단가 자동기입
            for (let i = 0; i < selectedTr.length; i++) {
                // 계산식 미리 생성해서 data-price로 넣기
                var itemPrice = parseFloat($(selectedTr[i]).find(".itemListPrice").val());
                // 각 행을 동적으로 생성하여 tbody에 추가
                var htmlString = `
                    <tr>
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
            $(".itemAmount").off("input").on("input", function() {
                let itemAmount = parseFloat($(this).val());
                let price = parseFloat($(this).data("price"));
                let itemAllPrice = itemAmount * price;
                console.log(itemAmount);
                console.log(price);
                console.log(itemAllPrice);
                // NaN 생기는거 방지
                if(isNaN(itemAmount) || $(".itemAmount").val() == undefined || isNaN(price)) {
                    $(this).parent().parent().find(".itemAllPrice").text("");
                } else {
                    $(this).parent().parent().find(".itemAllPrice").html(itemAllPrice + '<input type="hidden" name="itemAllPrice">')
                }
            })
        })
    })

    // 닫기버튼
    $(function () {
        // 품목리스트 닫기
        $(".close_item_list").off("click").on("click", function () {
            $(".item_list_wrap").hide();
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

</script>

<div class="receiving_management_header">입고관리</div>
<div class="receiving_management_list_header">입고신청목록</div>
<div class="receiving_management_list_container">
	<div class="receiving_management_list_buttonset_container">
		<div class="receiving_management_list_buttonset1">
			<div>전체</div>
			<div>결재대기</div>
			<div>결재완료</div>
			<div>반려</div>
		</div>
		<div class="receiving_management_list_buttonset2">
			<div>
				<button type="button" class="show_item_list">입고신청</button>
			</div>
			<div>
				<button type="button">선택수정</button>
			</div>
			<div>
				<button type="button">선택삭제</button>
			</div>
		</div>
	</div>
	<div class="date_search_set">
		<input type="date">
		<button type="button">선택날짜조회</button>
	</div>
	<div class="receiving_management_list_table_container">
		<table border="1" class="receiving_management_list_table">
			<thead>
				<tr>
					<th></th>
					<th><input type="checkbox" id="selectAllRequestList">
					</th>
					<th>거래번호</th>
					<th>거래처</th>
					<th>상태 <!-- 결재대기, 결재완료, 반려 -->
					</th>
					<th>입고일</th>
					<th>총금액</th>
					<th>신청일</th>
					<th>신청자</th>
					<th>수정일</th>
					<th>수정자</th>
					<th>결제자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1</th>
					<th><input type="checkbox" class="selectRequestList">
					</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>





<div class="center_line">
	<!-- 중앙 구분선 -->
</div>





<div class="receiving_management_detail_header">상세</div>

<div class="receiving_management_detail_table_container">
	<table border="1" class="receiving_management_detail_table">
		<thead>
			<tr>
				<th></th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>LOT</th>
				<th>입고전 재고</th>
				<th>입고후 재고</th>
				<th>입고신청수량</th>
				<th>단가</th>
				<th>총금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>(현재고)</td>
				<td>(현재고 + 입고신청수량)</td>
				<td></td>
				<td></td>
				<td>(단가x입고신청수량)</td>
			</tr>
		</tbody>
	</table>
</div>




<!-- 품목리스트 팝업창 -->
<div class="item_list_wrap">
	<div class="item_list_button_container">
		<div class="item_list_buttonset1">
			<div class="item_list_header">품목리스트</div>
			<div>
				<button type="button" class="close_item_list">x</button>
			</div>
		</div>
		<div class="item_list_buttonset2">
			<div>
				<select name="listName">
					<option value="품목코드">품목코드</option>
					<option value="품목명">품목명</option>
					<option value="거래처">거래처</option>
				</select> <input type="text">
				<button type="button">검색</button>
			</div>
		</div>
	</div>
	<div class="item_list_table_container">
		<table border="1" class="item_list_table">
			<thead>
				<tr>
					<th></th>
					<th><input type="checkbox" id="selectAllItemList"></th>
					<th>품목코드</th>
					<th>품목명</th>
					<th>거래처</th>
					<th>단가(원)</th>
					<th>현 재고(EA)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1</th>
					<th><input type="checkbox" class="selectItemList"></th>
					<td>임의의 품목코드리스트1 <input type="hidden" value="임의의 품목코드리스트1"
						class="itemListCode">
					</td>
					<td>임의의 품목명리스트1 <input type="hidden" value="임의의 품목명리스트1"
						class="itemListName">
					</td>
					<td>임의의 거래처 <input type="hidden" value="임의의 거래처"
						class="itemListCompany">
					</td>
					<td>100 <input type="hidden" value="100" class="itemListPrice">
					</td>
					<td>20 <input type="hidden" value="20"
						class="itemListCurrentAmount">
					</td>
				</tr>
				<tr>
					<th>1</th>
					<th><input type="checkbox" class="selectItemList"></th>
					<td>임의의 품목코드리스트2 <input type="hidden" value="임의의 품목코드리스트2"
						class="itemListCode">
					</td>
					<td>임의의 품목명리스트2 <input type="hidden" value="임의의 품목명리스트2"
						class="itemListName">
					</td>
					<td>임의의 거래처 <input type="hidden" value="임의의 거래처"
						class="itemListCompany">
					</td>
					<td>100 <input type="hidden" value="100" class="itemListPrice">
					</td>
					<td>20 <input type="hidden" value="20"
						class="itemListCurrentAmount">
					</td>
				</tr>
				<tr>
					<th>1</th>
					<th><input type="checkbox" class="selectItemList"></th>
					<td>임의의 품목코드리스트 <input type="hidden" value="임의의 품목코드리스트"
						class="itemListCode">
					</td>
					<td>임의의 품목명리스트 <input type="hidden" value="임의의 품목명리스트"
						class="itemListName">
					</td>
					<td>임의의 거래처2 <input type="hidden" value="임의의 거래처2"
						class="itemListCompany">
					</td>
					<td>100 <input type="hidden" value="100" class="itemListPrice">
					</td>
					<td>20 <input type="hidden" value="20"
						class="itemListCurrentAmount">
					</td>
				</tr>
			</tbody>
		</table>
		<div class="show_request_item_div">
			<button type="button" class="show_request_item">입고신청서 작성</button>
		</div>
	</div>
</div>


<!-- 입고신청서 작성 팝업창 -->
<div class="request_item_wrap">
	<div class="request_item_buttonset">
		<div>입고신청서</div>
		<div>
			<button type="button" class="close_request_item">x</button>
		</div>
	</div>
	<div class="request_item_table_container">
		<table border="1" class="request_item_table">
			<thead class="request_item_table_thead">
				<tr>
					<th>입고신청일</th>
					<td colspan="2" id="requestDateTd"></td>
					<input type="hidden" value="" name="requestDate" id="requestDate">
					<th>입고신청자</th>
					<td colspan="2"><input type="text" name="reqeustPerson"
						id="reqeustPerson"></td>
				</tr>

				<tr>
					<th>입고주소</th>
					<td colspan="5"><input type="date" name="requestAddr"
						id="requestAddr"></td>
				</tr>

				<tr>
					<th>거래처명</th>
					<td colspan="2" id="companyNameTd"></td>
					<input type="hidden" name="companyName" id="companyName">
					<th>담당자</th>
					<td colspan="2" id="companyEmployeeTd"></td>
					<input type="hidden" name="companyEmployee" id="companyEmployee">
				</tr>

				<tr>
					<th>거래처주소</th>
					<td colspan="5" id="companyAddrTd"></td>
					<input type="hidden" name="companyAddr" id="companyAddr">
				</tr>


				<tr>
					<th>품목코드</th>
					<th>품목명</th>
					<th>수량</th>
					<th>단가(EA)</th>
					<th>총 금액</th>
				</tr>
			</thead>
			<tbody class="request_item_table_tbody">
				<tr>
					<!-- 각 행을 동적으로 생성하여 tbody에 추가 -->
				</tr>
			</tbody>
		</table>
	</div>
	<div class="done_request_item_div">
		<button type="button">작성완료</button>
	</div>
</div>