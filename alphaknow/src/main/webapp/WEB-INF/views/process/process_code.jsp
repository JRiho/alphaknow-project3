<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.alphaknow.dto.processcodeDTO.ProcessCodeDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/alphaknow/resources/css/process_code.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


<body>
	
	<div id="process_code">
		<div class="top_section">
			<div class="title_select_container">
				<h1>공정코드관리</h1>
			</div>
			<form action="alphaknow/processcode" method="post">
			<div id="process_code_button">
				<button type="button" class="change_button" id="new_process_button">추가</button>
                <button type="button" class="edit_button change_button" data-id="${process.sequenceNo}">수정</button>
                <button type="button" class="change_button" onclick="deleteSelectedProcess();">삭제</button>
			</div>
			</form>
		</div>
		<div>
			공정수 : <input type="text" id="process_code_count"> 총 ST : <input
				type="text" id="process_st_count">
		</div>
	</div>
	<br><br>
	<div id="main_content">
		<table id="process_board">
			<!-- 테이블 너비 조절 -->
			<colgroup>
				<col style="width: 4.29%" />
				<col style="width: 4.29%" />
				<col style="width: 4.29%" />
				<col style="width: 4.29%" />
				<col style="width: 15%" />
				<col style="width: 11%" />
				<col style="width: 30%" />
				<col style="width: 4.29%" />
				<col style="width: 10%" />
				<col style="width: 4.29%" />
				<col style="width: 4.29%" />
				<col style="width: 4.29%" />
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>순서</th>
					<th>코드</th>
					<th>에러코드</th>
					<th>공정약칭</th>
					<th>공정별칭</th>
					<th>공정구분</th>
					<th>기준</th>
					<th>ST(표준작업시간)</th>
					<th>가성</th>
					<th>진성</th>
					<th>반복</th>
				</tr>
			</thead>

			<tbody>
				 <c:forEach var="process" items="${processCodeList}">
                    <tr>
                    	<th><input 
                    			type="checkbox" 
                    			name="selectedProcess"
                    	 		value="${process.sequenceNo}"
                    	 		data-id="${process.sequenceNo}"></th>
                        <td>${process.sequenceNo}</td>
                        <td>${process.code}</td>
                        <td>${process.errorCode}</td>
                        <td>${process.processAbbreviation}</td>
                        <td>${process.processAlias}</td>
                        <td>${process.processType}</td>
                        <td>${process.standard}</td>
                        <td>${process.standardWorkingTime}</td>
                        <td>${process.fakeFaultWarning}</td>
                        <td>${process.genuineFaultWarning}</td>
                        <td>${process.repeatable}</td>
                    </tr>
                </c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 공정 신규등록 및 수정 팝업 div -->
	<div id="process_new_register" style="display:none;">
        <div id="process_title">공정명 등록/수정</div>
        <div id="table_wrap">
            <form action="/alphaknow/processcode" method="post">
            	<input type="hidden" name="action" id="form_action" value="add"> 
            	<input type="hidden" name="sequenceNo"> 
                <table id="new_process">
                    <colgroup>
                        <col style="width: 30%" />
                        <col style="width: 70%" />
                    </colgroup>
                    <tr>
                        <td>코드</td>
                        <td><input type="text" class="text" name="code" placeholder="진행코드"></td>
                    </tr>
                    <tr>
                        <td>에러코드</td>
                        <td><input type="text" class="text" name="errorCode" placeholder="에러코드"></td>
                    </tr>
                    <tr>
                        <td>공정약칭</td>
                        <td><input type="text" class="text" name="processAbbreviation" placeholder="공정약칭"></td>
                    </tr>
                    <tr>
                        <td>공정별칭</td>
                        <td><input type="text" class="text" name="processAlias" placeholder="공정별칭"></td>
                    </tr>
                    <tr>
                        <td>공정구분</td>
                        <td><input type="text" class="text" name="processType" placeholder="공정구분"></td>
                    </tr>
                    <tr>
                        <td>기준</td>
                        <td><input type="text" class="text" name="standard" placeholder="기준"></td>
                    </tr>
                    <tr>
                        <td>ST</td>
                        <td><input type="text" class="text" name="standardWorkingTime" placeholder="표준작업시간을 입력"></td>
                    </tr>
                    <tr>
                        <td>가성불량경고</td>
                        <td><input type="text" class="text" name="fakeFaultWarning"></td>
                    </tr>
                    <tr>
                        <td>진성불량경고</td>
                        <td><input type="text" class="text" name="genuineFaultWarning"></td>
                    </tr>
                    <tr>
                        <td>반복</td>
                        <td><input type="text" class="text" name="repeatable"></td>
                    </tr>
                </table>
                <div id="setting_button">
                    <button type="submit" class="change_button" id="save_button">저장</button>
                    <button type="button" class="button_basic" id="close">닫기</button>
                </div>
            </form>
        </div>
    </div>

	<script src="/alphaknow/resources/js/process_code.js"></script>
	 <script src="/alphaknow/resources/js/processcode_popup.js"></script>
		
</body>

