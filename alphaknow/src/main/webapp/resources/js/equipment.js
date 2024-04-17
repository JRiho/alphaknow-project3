$(function() {
		$("#datepicker1").datepicker(
				{
					dateFormat : "yy-mm-dd", // 날짜 형식 설정
					changeMonth : true, // 월 변경 가능
					changeYear : true, // 연도 변경 가능
					showButtonPanel : true, // 오늘 날짜로 이동 및 달력 닫기 버튼 표시
					onClose : function(selectedDate) {
						// 시작 날짜 선택 후, 종료 날짜의 minDate 설정
						$("#datepicker2").datepicker("option", "minDate",
								selectedDate);
					}
				});
	});
	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : "yy-mm-dd", // 날짜 형식 설정
			changeMonth : true, // 월 변경 가능
			changeYear : true, // 연도 변경 가능
			showButtonPanel : true
		// 오늘 날짜로 이동 및 달력 닫기 버튼 표시
		});
	});