// 새글쓰기 관련 이벤트
$(function () {
	// 사원등록 버튼 클릭
	$("#boardWrite_btn").off("click").on("click", function () {
		$("#pop_main").show();
	})
	// 사원등록 닫기 버튼 클릭
	$("#close").off("click").on("click", function () {
		$("#pop_main").hide();
	})
})

// 클릭한 행의 게시글번호 찾기
$(function () {
	$(".detail_btn").off("click").on("click", function () {
		// 사원번호 확보
		let tr = $(this).parent().parent();
		// console.log($(this).parent().parent()[0])
		let boardno = tr.find(".selectBoardNum").val();
		$("#selBoardNo").val(boardno);
		// 게시글번호를 들고 아작스로 이동

		// Ajax
		$(function () {
			// AJAX 요청 실행
			$.ajax({
				url: "/alphaknow/board/ajax.doSelect?boardno=" + boardno, // 요청할 URL
				method: "GET", // HTTP 요청 메서드 (GET, POST 등)
				dataType: "json", // 응답 데이터 타입 (json, xml, html 등)
				success: function (data) {
					// 요청 성공 시 처리할 로직
					// console.log("data : ", data[0]);
					// data값 활용

					// 타임스탬프를 Date 객체로 변환
					let timestamp = data[0].createdDate;
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

					// 데이터를 div에 넣기 (나중에 업데이트에 쓸 id도 넣기)
					$(".titleDetail").html('<input type="text" class="hide" name="boardTitle" value="' + data[0].boardTitle + '">' + '<span class="show">' + data[0].boardTitle + '</span>');
					$(".writerDetail").html(data[0].employeeName)
					$(".employeeKey").html(data[0].employeeKey)
					$(".contentDetail").html('<textarea name="boardContent" class="hide" >' + data[0].boardContent + '</textarea>' + '<span class="show">' + data[0].boardContent + '</span>');

				},
				error: function (xhr, status, error) {
					// 요청 실패 시 처리할 로직
					console.error("데이터를 가져오는 중 오류가 발생했습니다:", error);
					// 오류 처리 등의 작업을 수행
				}
			})
		})
		// 작업 후 사원정보 창 보이게 하기
		$("#pop_detail").show();
	})
})

// 게시글상세 관련 이벤트
$(function () {
	// 게시글상세 닫기 버튼 클릭
	$("#close2").off("click").on("click", function () {
		window.location.reload();
	})
})

// 수정완료버튼 클릭
$(function () {
	$("#updateComplete").off("click").on("click", function () {
		// form 데이터를 쿼리스트링으로 변환
		let formData = $("#myForm").serialize(); // form의 데이터를 URL 인코딩된 문자열로 반환
		console.log(formData)

		// Ajax
		$(function () {
			// AJAX 요청 실행
			$.ajax({
				url: "/alphaknow/board/ajax.doUpdate?" + formData, // 요청할 URL
				method: "GET", // HTTP 요청 메서드 (GET, POST 등)
				dataType: "json", // 응답 데이터 타입 (json, xml, html 등)
				success: function (data) {
					// 요청 성공 시 처리할 로직
					console.log("data : ", data);
					// data값 활용		                

					// input의 class hide와 span의 show가 바뀌게 설정
					$("input.show").removeClass("show").addClass("hide");
					$("textarea.show").removeClass("show").addClass("hide");
					$("span.hide").removeClass("hide").addClass("show");

					// 상세정보의 게시글번호와 같은 값을 테이블에서 찾아서 변경하기
					$(".selBoardNum").each(function () {
						var boardNum = $(this).val();
						// 같은 값을 가진 요소의 tr
						var tr = $(".selectBoardNum").filter(function () {
							return $(this).val() === boardNum;
						}).parent().parent();

						// tr에 값 넣기(사원관리부분)
						tr.find(".selBoardTitle").text(data.boardTitle)

						// (사원정보부분) 수정된 값으로 바뀌도록 넣기
						$(".titleDetail").html('<input type="text" class="hide" name="boardTitle" value="' + data.boardTitle + '">' + '<span class="show">' + data.boardTitle + '</span>');
						$(".contentDetail").html('<textarea name="boardContent" class="hide" >' + data.boardContent + '</textarea>' + '<span class="show">' + data.boardContent + '</span>');
					});

				},
				error: function (xhr, status, error) {
					// 요청 실패 시 처리할 로직
					console.error("데이터를 가져오는 중 오류가 발생했습니다:", error);
					// 오류 처리 등의 작업을 수행
				}
			})
		})
		$("#updateComplete").hide();
		$("#update").css("display", "inline-block");
	})

})

// 삭제버튼 클릭
$(function () {
	$("#delete").off("click").on("click", function () {
		if (confirm("삭제하겠습니까?")) {
			$("#myForm").attr("action", "/alphaknow/board/delete")
			$("#myForm").submit();
		}
	})
})


if (sessionStorage.getItem(

	// 수정 버튼 클릭 시
	$(document).ready(function () {
		$("#update").off("click").on("click", function () {

			// 수정버튼 숨기기
			$("#update").hide();
			// 수정완료버튼 보이기
			$("#updateComplete").css('display', 'inline-block');

			// input의 class hide와 span의 show가 바뀌게 설정
			$("input.hide").removeClass("hide").addClass("show");
			$("textarea.hide").removeClass("hide").addClass("show");
			$("span.show").removeClass("show").addClass("hide");

		})
	})
))


// 체크박스(관리자 모드에서 선택 후 삭제 가능)
window.addEventListener('load', function () {
	document.querySelector('#selectAll').addEventListener('click', function () {
		console.log("click")
		let checkboxes = document.querySelectorAll(".checkbox");

		if (document.querySelector('#selectAll').checked == true) {
			checkboxes.forEach(function (checkbox) {
				checkbox.checked = true;
			});
		} else {
			checkboxes.forEach(function (checkbox) {
				checkbox.checked = false;
			});
		}
	});
})
// css
