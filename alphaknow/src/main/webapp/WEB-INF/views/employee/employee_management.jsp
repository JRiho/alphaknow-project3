<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- <script src="https://code.jquery.com/jquery-4.0.0-beta.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
	// 클릭한 행의 사원번호 찾기
	$(function() {
		$(".detailInfo").off("click").on("click", function() {
			// 사원번호 확보
			let tr = $(this).parent().parent();
			let empno = tr.find("#employeeKey").text();
			// console.log("empno : " + empno);
			// 사원번호를 들고 아작스로 이동
			
			// Ajax
			$(function() {    
		        // AJAX 요청 실행
		        $.ajax({
		            url: "/alphaknow/employee/ajax.doSelect?empno=" + empno, // 요청할 URL
		            method: "GET", // HTTP 요청 메서드 (GET, POST 등)
		            dataType: "json", // 응답 데이터 타입 (json, xml, html 등)
		            success: function(data) {
		                // 요청 성공 시 처리할 로직
		                // console.log("data : ", data[0]);
		                // data값 활용
		                
		                // 타임스탬프를 Date 객체로 변환
						let timestamp = data[0].employeeDate;
						let date = new Date(timestamp);
						
						// "yyyy-mm-dd" 형식으로 날짜 문자열 포맷팅
						let formattedDate = formatDate(date);
						
						// console.log("Formatted Date:", formattedDate);
						
						// 날짜를 "yyyy-mm-dd" 형식으로 포맷팅하는 함수
						function formatDate(date) {
						    let year = date.getFullYear();
						    let month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 필요
						    let day = ('0' + date.getDate()).slice(-2);
						    
						    return year + '-' + month + '-' + day;
						}
		                
						// 데이터를 td에 넣기 (나중에 업데이트에 쓸 id도 넣기)
		                $(".departmentName").html('<span class="show">' + data[0].departmentName + '</span>')
		                $(".employeeDate").html(formattedDate)
		                $(".employeeId").html('<input type="text" class="hide" name="employeeId" id="updateEmployeeId" value='+ data[0].employeeId +'>' + '<span class="show">' + data[0].employeeId + '</span>')
		                $(".employeeKey").html('<span class="show">' + data[0].employeeKey + '</span>')
		                $(".employeeName").html('<input type="text" class="hide" name="employeeName" id="updateEmployeeName" value='+ data[0].employeeName +'>' + '<span class="show">' + data[0].employeeName + '</span>')
		                $(".employeePhone").html('<input type="text" class="hide" name="employeePhone" id="updateEmployeePhone" value='+ data[0].employeePhone +'>' + '<span class="show">' + data[0].employeePhone + '</span>')
		                $(".employeePw").html('<input type="password" class="hide" name="employeePw" id="updateEmployeePw" value='+ data[0].employeePw +'>' + '<span class="show">' + data[0].employeePw + '</span>')
		                $(".employmentStatus").html('<span class="show">' + data[0].employmentStatus + '</span>' + '<span class="hide">' + data[0].employmentStatus + '</span>')
		                $(".jobGrade").html('<span class="show">' + data[0].jobGrade + '</span>' + '<span class="hide">' + data[0].jobGrade + '</span>')
		                
		            },
		            error: function(xhr, status, error) {
		                // 요청 실패 시 처리할 로직
		                console.error("데이터를 가져오는 중 오류가 발생했습니다:", error);
		                // 오류 처리 등의 작업을 수행
		            }
		        })  
			})
			// 작업 후 사원정보 창 보이게 하기
			$(".employee_infoDetail").show();
		})
	})
	
	// 사원등록 관련 이벤트
	$(function() {
		// 사원등록 버튼 클릭
		$("#show_employee_regedit").off("click").on("click", function() {
			$(".employee_regedit").show();
		})
		// 사원등록 닫기 버튼 클릭
		$("#hide_employee_regedit").off("click").on("click", function() {
			$(".employee_regedit").hide();
		})
	})
	
	// 사원세부정보 관련 이벤트
	$(function() {
		// 사원세부정보 닫기 버튼 클릭
		$("#hide_employee_infoDetail").off("click").on("click", function() {
			$(".employee_infoDetail").hide();
		})
	})
	
	// 수정 버튼 클릭 시
	$(document).ready(function() {
    	$(".modifyEmployee").off("click").on("click", function() {
			
    		// 기존 데이터 수집 (json형식)
    		let oldData = {
    			"departmentName": $(".departmentName").text(),
    			"employeeDate": $(".employeeDate").text(),
    			"employeeId": $(".employeeId").text(),
    			"employeeKey": $(".employeeKey").text(),
    			"employeeName": $(".employeeName").text(),
    			"employeePhone": $(".employeePhone").text(),
    			"employeePw": $(".employeePw").text(),
    			"employmentStatus": $(".employmentStatus").text(),
    			"jobGrade": $(".jobGrade").text()
    		};
			
			// console.log(oldData)
    		
	        // input의 class hide와 span의 show가 바뀌게 설정
	        $("input.hide").removeClass("hide").addClass("show");
			$("span.show").removeClass("show").addClass("hide");
			$("span.hide").removeClass("hide").addClass("show");
	        
	     	// departmentName 요소의 input을 select 요소로 변경
	        let departmentSelect = $("<select>").attr("name", "departmentName"); // select 요소 생성
	        $(".departmentName input").replaceWith(departmentSelect); // input 요소를 select 요소로 교체

	        // employmentStatus 요소의 input을 select 요소로 변경
	        let employmentStatusSelect = $("<select>").attr("name", "employmentStatus"); // select 요소 생성
	        $(".employmentStatus input").replaceWith(employmentStatusSelect); // input 요소를 select 요소로 교체
	        
	     	// jobGrade 요소의 input을 select 요소로 변경
	        let jobGradeSelect = $("<select>").attr("name", "jobGrade"); // select 요소 생성
	        $(".jobGrade span").replaceWith(jobGradeSelect); // input 요소를 select 요소로 교체

	        // 각 select 요소에 option 요소 추가
	        // departmentName select 요소에 option 추가
	        departmentSelect.append(
	            $("<option>").text("생산").val("생산"),
	            $("<option>").text("사무").val("사무"),
	            $("<option>").text("영업").val("영업")
	        );

	        // employmentStatus select 요소에 option 추가
	        employmentStatusSelect.append(
	            $("<option>").text("재직").val("재직"),
	            $("<option>").text("휴직").val("휴직"),
	            $("<option>").text("퇴사").val("퇴사")
	        );
	        
	     // jobGrade select 요소에 option 추가
	        jobGradeSelect.append(
	            $("<option>").text("인턴").val("인턴"),
	            $("<option>").text("사원").val("사원"),
	            $("<option>").text("주임").val("주임"),
	            $("<option>").text("대리").val("대리"),
	            $("<option>").text("과장").val("과장"),
	            $("<option>").text("차장").val("차장"),
	            $("<option>").text("부장").val("부장"),
	            $("<option>").text("사장").val("사장")
	        );
    	})
    })
	
	
	// 수정완료버튼 클릭
	$(function() {
		$(".modifyEmployeeEnd").off("click").on("click", function() {
			// form 데이터를 쿼리스트링으로 변환
	        let formData = $("#updateForm").serialize(); // form의 데이터를 URL 인코딩된 문자열로 반환
	        console.log(formData)
			
			// Ajax
// 			$(function() {    
// 		        // AJAX 요청 실행
// 		        $.ajax({
// 		            url: "/alphaknow/employee/ajax.doUpdate", // 요청할 URL
// 		            method: "GET", // HTTP 요청 메서드 (GET, POST 등)
// 		            dataType: "json", // 응답 데이터 타입 (json, xml, html 등)
// 		            success: function(data) {
// 		                // 요청 성공 시 처리할 로직
// 		                //console.log("data : ", data[0]);
// 		                // data값 활용
		                
// 		                // 타임스탬프를 Date 객체로 변환
// 						let timestamp = data[0].employeeDate;
// 						let date = new Date(timestamp);
						
// 						// "yyyy-mm-dd" 형식으로 날짜 문자열 포맷팅
// 						let formattedDate = formatDate(date);
						
// 						// console.log("Formatted Date:", formattedDate);
						
// 						// 날짜를 "yyyy-mm-dd" 형식으로 포맷팅하는 함수
// 						function formatDate(date) {
// 						    let year = date.getFullYear();
// 						    let month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 필요
// 						    let day = ('0' + date.getDate()).slice(-2);
						    
// 						    return year + '-' + month + '-' + day;
// 						}
		                
						
// 		                $(".departmentName").text(data[0].departmentName)
// 		                $(".employeeDate").text(formattedDate)
// 		                $(".employeeId").text(data[0].employeeId)
// 		                $(".employeeKey").text(data[0].employeeKey)
// 		                $(".employeeName").text(data[0].employeeName)
// 		                $(".employeePhone").text(data[0].employeePhone)
// 		                $(".employeePw").text(data[0].employeePw)
// 		                $(".employmentStatus").text(data[0].employmentStatus)
// 		                $(".jobGrade").text(data[0].jobGrade)
		                
// 		            },
// 		            error: function(xhr, status, error) {
// 		                // 요청 실패 시 처리할 로직
// 		                console.error("데이터를 가져오는 중 오류가 발생했습니다:", error);
// 		                // 오류 처리 등의 작업을 수행
// 		            }
// 		        })  
// 			})
// 			$(".employee_infoDetail").show();
		})
	})
	
</script>
<style>
	/* 사원등록 */
	.employee_regedit {
		display: none;
	}
	/* 사원세부정보 */
	.employee_infoDetail {
		display: none;
	}
	.show {
		display: block;
	}
	.hide {
		display: none;
	}
	
</style>

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
		<form id="updateForm" method="get" action="/alphaknow/employee/ajax.doUpdate">
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
			<button type="button">삭제</button>
		</form>
	</div>

</body>