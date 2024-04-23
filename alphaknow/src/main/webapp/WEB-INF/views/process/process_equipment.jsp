<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List"%>
<%@ page import="com.spring.alphaknow.dto.equipmentDTO.Equipment"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="/alphaknow/resources/css/process_equipment.css">
<script src="/alphaknow/resources/js/equipment.js"></script>
<script>
	document.addEventListener('DOMContentLoaded',function() {
	// "추가" 버튼 클릭 이벤트
						document
								.getElementById('addButton')
								.addEventListener(
										'click',
										function(event) {
											event.preventDefault();
											var form = document
													.getElementById('equipmentForm');
											form.action = '/alphaknow/equipment?action=add';
											form.submit();
										});

						// "수정" 버튼 클릭 이벤트
						document
								.getElementById('updateButton')
								.addEventListener(
										'click',
										function() {
											var selected = document
													.querySelector('input[name="selectedEquipment"]:checked');
											if (selected) {
												var equipmentCode = selected.value;
												var form = document
														.getElementById('equipmentForm');
												form.action = '/alphaknow/equipment?action=update&equipment_code='
														+ equipmentCode;
												form.submit();
											} else {
												alert('수정할 장비를 선택해주세요.');
											}
										});
						// "삭제" 버튼 클릭 이벤트
						document
								.getElementById('deleteButton')
								.addEventListener(
										'click',
										function() {
											var selected = document
													.querySelectorAll('input[name="selectedEquipment"]:checked');
											if (selected.length > 0) {
												var form = document
														.getElementById('equipmentForm');
												// 기존의 equipment_code 숨겨진 필드를 제거
												document
														.querySelectorAll(
																'input[name="equipment_code"]')
														.forEach(
																function(input) {
																	form
																			.removeChild(input);
																});
												// 선택된 각 체크박스에 대해 숨겨진 필드를 폼에 추가
												selected
														.forEach(function(
																checkbox) {
															var input = document
																	.createElement('input');
															input.type = 'hidden';
															input.name = 'equipment_code';
															input.value = checkbox.value;
															form
																	.appendChild(input);
														});
												form.action = '/alphaknow/equipment?action=delete';
												form.submit();
											} else {
												alert('삭제할 장비를 선택해주세요.');
											}
										});

					});
	function allcheck() {
		// thead의 체크박스 상태 가져오기
		var isAllChecked = document.querySelector('input[name="allcheck"]').checked;

		// tbody 내의 모든 체크박스 선택/선택 해제
		document.querySelectorAll('input[name="selectedEquipment"]').forEach(
				function(checkbox) {
					checkbox.checked = isAllChecked;
				});
	}
</script>

	<div>
		<h1>공정기준 - 장비정보관리</h1>
		<form id="equipmentForm" action="/alphaknow/equipment" method="post">
			<table class="equipment_table">
				<tr>
					<td><span>장비명:</span></td>
					<td><input type="text" name="equipmentName"></td>
					<td><span>관리번호:</span></td>
					<td><input type="text" name="managementNumber"></td>
					<td><span>제조사:</span></td>
					<td><input type="text" name="manufacturer"></td>
					<td rowspan="2"><button type="button" id="addButton"
							class="change_button">추가</button></td>
				</tr>
				<tr>
					<td><span>구입업체명:</span></td>
					<td><input type="text" name="purchasingCompanyName"></td>
					<td><span>수리업체명:</span></td>
					<td><input type="text" name="repairCompanyName"></td>
					<td><span>관리자:</span></td>
					<td><input type="text" name="manager"></td>
				</tr>
				<tr>
					<td><span>위치:</span></td>
					<td><input type="text" name="location"></td>
					<td><span>용도:</span></td>
					<td><input type="text" name="usage"></td>
					<td><span>사용여부:</span></td>
					<td><select name="usageStatus">
							<option value="T">True</option>
							<option value="F">False</option>
					</select></td>
					<td rowspan="1"><button type="button" id="updateButton"
							class="change_button">수정</button></td>
				</tr>
				<tr>
					<td><span>구매일:</span></td>
					<td colspan="2"><input type="text" id="datepicker1"
						name="purchaseDate"></td>
					<td><span>이력등록일:</span></td>
					<td colspan="2"><input type="text" id="datepicker2"
						name="historyRegistrationDate"></td>
					<td rowspan="1"><button type="button" id="deleteButton"
							class="change_button">삭제</button></td>
				</tr>
			</table>
		</form>
	</div>


	<div id="main_content">
		<table id="equipment_board">
			<!-- 테이블 너비 조절 -->
			<colgroup>	
				<col style="width: 4%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
				<col style="width: 8%" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="allcheck"
						onclick="allcheck()"></th>
					<th>고유번호</th>
					<th>장비명</th>
					<th>관리번호</th>
					<th>제조사</th>
					<th>구입업체명</th>
					<th>수리업체명</th>
					<th>관리자</th>
					<th>위치</th>
					<th>용도</th>
					<th>사용여부</th>
					<th>구매일</th>
					<th>이력등록일</th>
				</tr>
			</thead>

			<tbody id="tbody_text">
				<c:forEach items="${equipmentList}" var="equipment">
					<tr>
						<th><input type="checkbox" name="selectedEquipment"
							value="${equipment.equipmentCode}"></th>
						<td>${equipment.equipmentCode}</td>
						<td>${equipment.equipmentName}</td>
						<td>${equipment.managementNumber}</td>
						<td>${equipment.manufacturer}</td>
						<td>${equipment.purchasingCompanyName}</td>
						<td>${equipment.repairCompanyName}</td>
						<td>${equipment.manager}</td>
						<td>${equipment.location}</td>
						<td>${equipment.usage}</td>
						<td>${equipment.usageStatus}</td>
						<td>${equipment.purchaseDate}</td>
						<td>${equipment.historyRegistrationDate}</td>
					</tr>
				</c:forEach>

			</tbody>

		</table>
	</div>

</html>
