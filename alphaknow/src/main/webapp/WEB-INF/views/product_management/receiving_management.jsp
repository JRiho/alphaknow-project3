<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/alphaknow/resources/css/receiving_management.css" />
<script src="https://code.jquery.com/jquery-4.0.0-beta.min.js"></script>
<script src="/alphaknow/resources/js/receiving_management.js"></script>

<div class="receiving_management_header">입고관리</div>
<div class="receiving_management_list_header">입고신청목록</div>
<div class="receiving_management_list_container">
	<div class="receiving_management_list_buttonset_container">
		<div class="receiving_management_list_buttonset1">
			<div>전체</div>
			<div>결재대기</div>
			<div>결재완료</div>
			<div>반려</div>
			<div>입고완료</div>
		</div>
		<div class="receiving_management_list_buttonset2">
			<div>
				<button type="button" class="show_item_list">입고신청</button>
			</div>
			<div>
				<button type="button" class="modify_item_list">선택수정</button>
			</div>
			<div>
				<button type="button" class="delete_item_list">선택삭제</button>
			</div>
			<div>
				<button type="button" class="sign_cancel">선택반려</button>
			</div>
			<div>
				<button type="button" class="end_sign">결재처리</button>
			</div>
			<div>
				<button type="button" class="receiving_complete">입고완료</button>
			</div>
		</div>
	</div>
	<div class="date_search_set">
		<input type="date"> ~ <input type="date">
		<button type="button">조회</button>
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
					<th>상태 <!-- 결재대기, 결재완료, 반려 --> </th>
					<th>입고일</th>
					<th>총금액</th>
					<th>신청일</th>
					<th>신청자</th>
					<th>수정일</th>
					<th>수정자</th>
					<th>결재자</th>
				</tr>
			</thead>
			<form id="deleteForm" method="get" action="/alphaknow/receivingManagement/delete">
				<tbody>
					<c:if test="${ not empty list }">
						<c:forEach var="list" items="${ list }" varStatus="status">
							<tr>
								<input type="hidden" name="trade_code" class="trade_code" value="${ list.TRADE_CODE }">
								<th>${ status.count }</th>
								<th><input type="checkbox" class="selectRequestList" name="trade_code_chk" value="${ list.TRADE_CODE }"></th>
								<td>${ list.TRADE_CODE }<input type="hidden" value="${ list.TRADE_CODE }"></td>
								<td>${ list.COMPANY_NAME }</td>
								<td class="sign_status_text">${ list.SIGN_STATUS }</td>
								<input type="hidden" name="sign_status" class="sign_status" value="${ list.SIGN_STATUS }">
								<td>${ list.RECEIVING_DATE }</td>
								<input type="hidden" class="receiving_date_css" value="${ list.RECEIVING_DATE }">
								<td>${ list.PRODUCT_ALL_PRICE }</td>
								<td>${ list.REQUEST_DATE }</td>
								<td>${ list.REQUEST_PERSON }</td>
								<td>${ list.MODIFY_REQUEST_DATE }</td>
								<td>${ list.MODIFY_REQUEST_PERSON }</td>
								<td>${ list.SIGN_PERSON }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<tr>
							<th colspan="12">입고신청한 물품이 없습니다.</th>
						</tr>
					</c:if>
				</tbody>
			</form>
		</table>
	</div>
</div>





<div class="center_line">
	<!-- 중앙 구분선 -->
</div>





<div class="receiving_management_detail_header">상세</div>
<div class="receiving_management_detail_table_container">
	<form id="inventoryForm" method="get" action="/alphaknow/receivingManagement/insert/toInventory">
	<table border="1" class="receiving_management_detail_table">
		<thead>
			<tr>
				<th></th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>LOT</th>
				<th>입고신청수량</th>
				<th>단가</th>
				<th>총금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th colspan="9">표시할 내용이 없습니다.</th>
			</tr>
		</tbody>
	</table>
	</form>
</div>




<!-- 품목리스트 팝업창 -->
<div class="item_list_wrap">
	<div class="item_list_button_container">
		<div class="item_list_buttonset1">
			<div class="item_list_header">품목리스트</div>
			<div>
				<button type="button" class="close_item_list">닫기</button>
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
				<!-- 동적으로 데이터값 추가  -->
			</tbody>
		</table>
		<div class="show_request_item_div">
			<button type="button" class="show_request_item">입고신청서 작성</button>
		</div>
	</div>
</div>


<!-- 입고신청서 작성 팝업창 -->
<div class="request_item_wrap">
	<form id="insertForm" method="get" action="/alphaknow/receivingManagement/insert">
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
					<th>거래번호</th><td colspan="4" id="tradecodeTd"></td>
					<input type="hidden" name="tradecode" id="tradecode">
				</tr>
				<tr>
					<th>입고신청일</th>
					<td colspan="2" id="requestDateTd"></td>
					<input type="hidden" name="requestDate" id="requestDate">
					<th>입고신청자</th>
					<td colspan="2"><input type="text" name="requestPerson"
						id="requestPerson"></td>
				</tr>

				<tr>
					<th>입고주소</th>
					<td colspan="5"><input type="text" name="requestAddr"
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
		<button type="button" id="done_request_btn">작성완료</button>
	</div>
	</form>
</div>


<!-- 입고신청서 수정 팝업창 -->
<div class="modify_item_wrap">
	<form id="updateForm" method="get" action="/alphaknow/receivingManagement/update">
	<div class="modify_item_buttonset">
		<div>입고신청서 수정</div>
		<div>
			<button type="button" class="close_modify_item">x</button>
		</div>
	</div>
	<div class="modify_item_table_container">
		<table border="1" class="modify_item_table">
			<thead class="modify_item_table_thead">
				<tr>
					<th>거래번호</th><td colspan="4" id="tradecodeTd"></td>
					<input type="hidden" name="tradecode" id="tradecode">
				</tr>
				<tr>
					<th>입고신청일</th>
					<td colspan="2" id="requestDateTd"></td>
					<input type="hidden" name="requestDate" id="requestDate">
					<th>입고신청자</th>
					<td colspan="2" id="requestPersonTd"><input type="hidden" name="requestPerson"
						id="requestPerson"></td>
				</tr>
				
				<tr>
					<th>수정일</th>
					<td colspan="2" id="modifyDateTd"></td>
					<input type="hidden" name="modifyDate" id="modifyDate">
					<th>수정자</th>
					<td colspan="2" id="modifyPerson"><input type="text" name="modifyPerson"
						id="modifyPerson"></td>
				</tr>

				<tr>
					<th>기존주소</th>
					<td colspan="5" id="oldRequestAddrTd"><input type="hidden" name="oldRequestAddr"
						id="oldRequestAddr"></td>
				</tr>
				<tr>
					<th>수정주소</th>
					<td colspan="5" id="modifyAddrTd"><input type="text" name="modifyAddr"
						id="requestAddr"></td>
				</tr>

				<tr>
					<th>거래처명</th>
					<td colspan="2" id="companyNameTd"></td>
					<th>담당자</th>
					<td colspan="2" id="companyEmployeeTd"></td>
				</tr>

				<tr>
					<th>거래처주소</th>
					<td colspan="5" id="companyAddrTd"></td>
				</tr>


				<tr>
					<th>품목코드</th>
					<th>품목명</th>
					<th>수량</th>
					<th>단가(EA)</th>
					<th>총 금액</th>
				</tr>
			</thead>
			<tbody class="modify_item_table_tbody">
				<tr>
					<!-- 각 행을 동적으로 생성하여 tbody에 추가 -->
				</tr>
			</tbody>
		</table>
	</div>
	<div class="done_request_item_div">
		<button type="button" id="done_modify_btn">작성완료</button>
	</div>
	</form>
</div>

<!-- 결재완료 버튼 클릭 팝업 -->
<div class="end_sign_wrap">
	<div class="sign_text_div">
		<input type="text" name="sign_person" placeholder="결제자명을 입력하세요.">
	</div>
	<div class="sign_buttonset">
		<button type="button" id="sign_ok">결재하기</button>
		<button type="button" id="sign_cancel">닫기</button>
	</div>
</div>