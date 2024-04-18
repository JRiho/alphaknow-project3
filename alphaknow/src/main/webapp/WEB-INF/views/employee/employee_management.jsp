<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- <script src="https://code.jquery.com/jquery-4.0.0-beta.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/alphaknow/resources/css/employee_management.css">
<script src="/alphaknow/resources/js/employee_management.js"></script>

<body>
	<div class="wrap_container">
		<div class="management_header">사원관리</div>
		<div class="employee_info">
			<table border="1">
				<thead>
					<tr>
						<th></th>
						<th>사원번호</th>
						<th>사원명</th>
						<th>부서명</th>
						<th>직급</th>
						<th>근속현황</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ not empty list }">
						<c:forEach var="emp" items="${list}" varStatus="num">
							<tr>
								<th>${ num.index + 1 }</th>
								<td class="selEmployeeKey">${ emp.employeeKey }<input type="hidden" class="selectEmployeeKey" value="${ emp.employeeKey }"></td>
								<td class="selEmployeeName">${ emp.employeeName }</td>
								<td class="selDepartmentName">${ emp.departmentName }</td>
								<td class="selJobGrade">${ emp.jobGrade }</td>
								<td class="selEmploymentStatus">${ emp.employmentStatus }</td>
								<td>
									<button type="button" class="detailInfo">상세정보</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<tr>
							<th>표시할 사원이 없습니다.</th>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<button type="button" id="show_employee_regedit">사원등록</button>
	</div>



	<div class="employee_regedit">
		<form action="/alphaknow/employee/insert" method="post">
			<div class="regedit_header">
				사원등록
				<button type="button" id="hide_employee_regedit">x</button>
			</div>
			<table border="1">
				<tr>
					<td>사원명</td>
					<td><input type="text" name="employeeName"></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><input type="text" name="employeePhone"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="employeeId"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="employeePw"></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password"></td>
				</tr>
				<tr>
					<td>부서</td>
					<td><select name="departmentName">
							<option value="생산">생산</option>
							<option value="사무">사무</option>
							<option value="영업">영업</option>
					</select></td>
				</tr>
			</table>
			<button type="submit">등록하기</button>
			<button type="reset">다시쓰기</button>
		</form>
	</div>



	<div class="employee_infoDetail">
		<form id="myForm">
			<div class="infoDetail_header">
				사원정보
				<button type="button" id="hide_employee_infoDetail">x</button>
			</div>
			<table border="1">
				<tr>
					<td>사원번호</td>
					<td class="employeeKey"></td>
				</tr>
				<tr>
					<td>사원명</td>
					<td class="employeeName"></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td class="employeePhone"></td>
				</tr>
				<tr>
					<td>입사일</td>
					<td class="employeeDate"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td class="employeeId"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td class="employeePw"></td>
				</tr>
				<tr>
					<td>부서</td>
					<td class="departmentName"></td>
				</tr>
				<tr>
					<td>직급</td>
					<td class="jobGrade"></td>
				</tr>
				<tr>
					<td>근속현황</td>
					<td class="employmentStatus"></td>
				</tr>
			</table>
			<button type="button" class="modifyEmployee">수정</button>
			<button type="button" class="modifyEmployeeEnd">수정완료</button>
			<button type="button" class="delEmployee">삭제</button>
		</form>
	</div>

</body>