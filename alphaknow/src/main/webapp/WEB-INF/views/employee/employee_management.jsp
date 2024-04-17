<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
	// 클릭한 행의 사원번호 찾기
	$(function(){
		$(".detailInfo").off("click").on("click", function(){
			let tr = $(this).parent().parent();
			let empno = tr.find("#employeeKey").text();
			// 사원번호 확보
			console.log("empno : " + empno)
			
			// Ajax
			$(function() {    
		        // AJAX 요청 실행
		        $.ajax({
		            url: "/alphaknow//employee/ajax.do?empno=" + empno, // 요청할 URL
		            method: "GET", // HTTP 요청 메서드 (GET, POST 등)
		            dataType: "json", // 응답 데이터 타입 (json, xml, html 등)
		            success: function(data) {
		                // 요청 성공 시 처리할 로직
		                console.log("data : ", data[0]);
		                // 여기서 받은 데이터를 활용하여 UI 업데이트 등의 작업을 수행할 수 있습니다.
		            },
		            error: function(xhr, status, error) {
		                // 요청 실패 시 처리할 로직
		                console.error("데이터를 가져오는 중 오류가 발생했습니다:", error);
		                // 오류 처리 등의 작업을 수행할 수 있습니다.
		            }
		        });   
			});						
		})
	})
	
	
	
	
</script>


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
								<td id="employeeKey">${ emp.employeeKey }</td>
								<td>${ emp.employeeName }</td>
								<td>${ emp.departmentName }</td>
								<td>${ emp.jobGrade }</td>
								<c:if test="${ '재직' == emp.employmentStatus }">
									<td>${ emp.employmentStatus }중</td>
								</c:if>
								<c:if test="${ '재직' != emp.employmentStatus }">
									<td>${ emp.employmentStatus }</td>
								</c:if>
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