<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/alphaknow/resources/css/process_product.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body>
	<div id="process_code">
		<div class="top_section">
			<div class="title_select_container">
				<h1>제품코드관리</h1>
			</div>
			<div id="process_code_button">
				<button type="button" class="change_button" id="new_process_button">추가</button>
				<button type="button" class="edit_button"
					data-id="${process.sequenceNo}">수정</button>
				<button type="button" onclick="deleteSelectedProcess();">삭제</button>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div id="main_content">
		<table id="process_board">
			<!-- 테이블 너비 조절 -->
			<colgroup>
				<col style="width: 8%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>코 드</th>
					<th>이 름</th>
					<th>가 격</th>
					<th>타 입</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="product" items="${product}">
					<tr>
						<th><input type="checkbox" name="selectedProduct"
							value="${product.sequenceNo}" data-id="${product.sequenceNo}"></th>
						<td>${product.productCode}</td>
						<td>${product.productName}</td>
						<td>${product.productPrice}</td>
						<td>${product.productType}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 공정 신규등록 및 수정 팝업 div -->
	<div id="process_new_register" style="display: none;">
		<div id="process_title">공정명 등록/수정</div>
		<div id="table_wrap">
			<form action="/product" method="get">
				<input type="hidden" name="_method" value="post" id="form_method">
				<table id="new_process">
					<colgroup>
						<col style="width: 30%" />
						<col style="width: 70%" />
					</colgroup>
					<tr>
						<td>코 드</td>
						<td><input type="text" class="text" name="productCode"
							placeholder="코 드"></td>
					</tr>
					<tr>
						<td>이 름</td>
						<td><input type="text" class="text" name="productName"
							placeholder="이 름"></td>
					</tr>
					<tr>
						<td>가 격</td>
						<td><input type="text" class="text" name="productPrice"
							placeholder="가 격"></td>
					</tr>
					<tr>
						<td>타 입</td>
						<td><select name="productType" class="text">
								<option value="part">부품</option>
								<option value="complete">완품</option>
						</select></td>
					</tr>

				</table>
				<div id="setting_button">
					<button type="submit" class="change_button">저장</button>
					<button type="button" class="button_basic" id="close">닫기</button>
				</div>
			</form>
		</div>
	</div>
	<script src="/alphaknow/resources/js/processcode_popup.js"></script>
</body>