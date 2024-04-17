<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
					</tr>
				</thead>
				<tbody>
					<c:if test="${ not empty list }">
						<c:forEach var="emp" items="${list}" varStatus="num">
							<tr>
								<th>${ num.index + 1 }</th>
								<td>${ emp.employeeKey }</td>
								<td>${ emp.employeeName }</td>
								<td>${ emp.departmentName }</td>
								<td>${ emp.jobGrade }</td>
								<c:if test="${ '재직' == emp.employmentStatus }">
									<td>${ emp.employmentStatus }중</td>
								</c:if>
								<c:if test="${ '재직' != emp.employmentStatus }">
									<td>${ emp.employmentStatus }</td>
								</c:if>
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



	<form action="/alphaknow/employee/insert" method="post">
		<div class="employee_regedit">
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
					<td><input type="number" name="employeePhone"></td>
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
		</div>
	</form>


	<div class="employee_infoDetail">
		<div class="infoDetail_header">
			사원정보
			<button type="button" id="hide_employee_infoDetail">x</button>
		</div>
		<table border="1">
			<tr>
				<td>사원번호</td>
				<td></td>
			</tr>
			<tr>
				<td>사원명</td>
				<td></td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td></td>
			</tr>
			<tr>
				<td>입사일</td>
				<td></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td></td>
			</tr>
			<tr>
				<td>부서</td>
				<td></td>
			</tr>
			<tr>
				<td>근속현황</td>
				<td></td>
			</tr>
		</table>
	</div>

</body>