// 클릭한 행의 사원번호 찾기
$(function () {
	console.log("test")
	$(".detailInfo").off("click").on("click", function () {
		// 사원번호 확보
		let tr = $(this).parent().parent();
		// console.log($(this).parent().parent()[0])
		let empno = tr.find(".selectEmployeeKey").val();
		// console.log(tr.find(".selectEmployeeKey")[0])
		// console.log("empno : " + empno);
		// 사원번호를 들고 아작스로 이동

		// Ajax
		$(function () {
			// AJAX 요청 실행
			$.ajax({
				url: "/alphaknow/employee/ajax.doSelect?empno=" + empno, // 요청할 URL
				method: "GET", // HTTP 요청 메서드 (GET, POST 등)
				dataType: "json", // 응답 데이터 타입 (json, xml, html 등)
				success: function (data) {
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
					$(".departmentName").html('<span class="show">' + data[0].departmentName + '</span>');
					$(".employeeDate").html(formattedDate)
					$(".employeeId").html('<input type="text" class="hide" name="employeeId" value="' + data[0].employeeId + '">' + '<span class="show">' + data[0].employeeId + '</span>')
					$(".employeeKey").html(data[0].employeeKey + '<input type="hidden" name="employeeKey" value="' + data[0].employeeKey + '">')
					$(".employeeName").html('<input type="text" class="hide" name="employeeName" value="' + data[0].employeeName + '">' + '<span class="show">' + data[0].employeeName + '</span>')
					$(".employeePhone").html('<input type="text" class="hide" name="employeePhone" value="' + data[0].employeePhone + '">' + '<span class="show">' + data[0].employeePhone + '</span>')
					$(".employeePw").html('<input type="password" class="hide" name="employeePw" value="' + data[0].employeePw + '">' + '<span class="show">' + data[0].employeePw + '</span>')
					$(".employeeStatus").html('<span class="show">' + data[0].employeeStatus + '</span>')
					$(".jobGrade").html('<span class="show">' + data[0].jobGrade + '</span>')

				},
				error: function (xhr, status, error) {
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
$(function () {
	// 사원등록 버튼 클릭
	$("#show_employee_regedit").off("click").on("click", function () {
		$(".employee_regedit").show();
	})
	// 사원등록 닫기 버튼 클릭
	$("#hide_employee_regedit").off("click").on("click", function () {
		$(".employee_regedit").hide();
	})
})

// 사원세부정보 관련 이벤트
$(function () {
	// 사원세부정보 닫기 버튼 클릭
	$("#hide_employee_infoDetail").off("click").on("click", function () {
		$(".employee_infoDetail").hide();
		$(".modifyEmployee").show();
		$(".modifyEmployeeEnd").hide();
	})
})

// 수정 버튼 클릭 시
$(document).ready(function () {
	$(".modifyEmployee").off("click").on("click", function () {

		// 수정버튼 숨기기
		$(".modifyEmployee").hide();
		// 수정완료버튼 보이기
		$(".modifyEmployeeEnd").css('display', 'inline-block');

		// input의 class hide와 span의 show가 바뀌게 설정
		$("input.hide").removeClass("hide").addClass("show");
		$("span.show").removeClass("show").addClass("hide");

		// departmentName 요소의 span을 select 요소로 변경
		let departmentSelect = $("<select>").attr("name", "departmentName"); // select 요소 생성
		$(".departmentName span").after(departmentSelect); // input 요소를 select 요소로 교체

		// employeeStatus 요소의 span을 select 요소로 변경
		let employeeStatusSelect = $("<select>").attr("name", "employeeStatus"); // select 요소 생성
		$(".employeeStatus span").after(employeeStatusSelect); // input 요소를 select 요소로 교체

		// jobGrade 요소의 span을 select 요소로 변경
		let jobGradeSelect = $("<select>").attr("name", "jobGrade"); // select 요소 생성
		$(".jobGrade span").after(jobGradeSelect); // span 요소를 select 요소로 교체

		// 각 select 요소에 option 요소 추가
		// departmentName select 요소에 option 추가
		departmentSelect.append(
			$("<option>").text("생산").val("생산"),
			$("<option>").text("사무").val("사무"),
			$("<option>").text("영업").val("영업")
		);

		// employeeStatus select 요소에 option 추가
		employeeStatusSelect.append(
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
$(function () {
	$(".modifyEmployeeEnd").off("click").on("click", function () {
		// form 데이터를 쿼리스트링으로 변환
		let formData = $("#myForm").serialize(); // form의 데이터를 URL 인코딩된 문자열로 반환
		console.log(formData)

		// Ajax
		$(function () {
			// AJAX 요청 실행
			$.ajax({
				url: "/alphaknow/employee/ajax.doUpdate?" + formData, // 요청할 URL
				method: "GET", // HTTP 요청 메서드 (GET, POST 등)
				dataType: "json", // 응답 데이터 타입 (json, xml, html 등)
				success: function (data) {
					// 요청 성공 시 처리할 로직
					console.log("data : ", data);
					// data값 활용		                

					// input의 class hide와 span의 show가 바뀌게 설정
					$("input.show").removeClass("show").addClass("hide");
					$("span.hide").removeClass("hide").addClass("show");

					// departmentName의 select문 지우기
					$(".departmentName select").remove()
					// jobGrade의 select문 지우기
					$(".jobGrade select").remove()
					// employeeStatus의 select문 지우기
					$(".employeeStatus select").remove()

					// 상세정보의 사원번호와 같은 값을 사원관리에서 찾아서 변경하기
					$(".employeeKey input").each(function () {
						var employeeKey = $(this).val();
						// 같은 값을 가진 요소의 tr
						var tr = $(".selectEmployeeKey").filter(function () {
							return $(this).val() === employeeKey;
						}).parent().parent();

						//  						console.log($(".selectEmployeeKey").filter(function() {
						//  						   	return $(this).val() === employeeKey;
						//  						}).parent().parent()[0])
						// tr에 값 넣기(사원관리부분)
						tr.find(".selEmployeeName").text(data.employeeName)
						tr.find(".selDepartmentName").text(data.departmentName)
						tr.find(".selJobGrade").text(data.jobGrade)
						tr.find(".selEmployeeStatus").text(data.employeeStatus)

						// (사원정보부분) 수정된 값으로 바뀌도록 넣기
						$(".departmentName").html('<span class="show">' + data.departmentName + '</span>');
						$(".employeeId").html('<input type="text" class="hide" name="employeeId" value="' + data.employeeId + '">' + '<span class="show">' + data.employeeId + '</span>')
						$(".employeeName").html('<input type="text" class="hide" name="employeeName" value="' + data.employeeName + '">' + '<span class="show">' + data.employeeName + '</span>')
						$(".employeePhone").html('<input type="text" class="hide" name="employeePhone" value="' + data.employeePhone + '">' + '<span class="show">' + data.employeePhone + '</span>')
						$(".employeePw").html('<input type="password" class="hide" name="employeePw" value="' + data.employeePw + '">' + '<span class="show">' + data.employeePw + '</span>')
						$(".employeeStatus").html('<span class="show">' + data.employeeStatus + '</span>')
						$(".jobGrade").html('<span class="show">' + data.jobGrade + '</span>')
					});

				},
				error: function (xhr, status, error) {
					// 요청 실패 시 처리할 로직
					console.error("데이터를 가져오는 중 오류가 발생했습니다:", error);
					// 오류 처리 등의 작업을 수행
				}
			})
		})
		$(".modifyEmployeeEnd").hide();
		$(".modifyEmployee").css("display", "inline-block");
	})
})

// 삭제버튼 클릭
$(function () {
	$(".delEmployee").off("click").on("click", function () {
		if (confirm("삭제하겠습니까?")) {
			$("#myForm").attr("action", "/alphaknow/employee/delete")
			$("#myForm").submit();
		}
	})
})