$(document).ready(function() {
    let processNewRegister = $("#process_new_register");

    // 공정 신규 추가 및 닫기 버튼 이벤트
    $("#new_process_button").click(function() {
        processNewRegister.show();
        clearInputs();
    });

    $("#close").click(function() {
        processNewRegister.hide();
        clearInputs();
    });

    // 수정 버튼 이벤트 리스너
    $('.edit_button').click(function() {
        let sequenceNo = $('input[name="selectedProcess"]:checked').val();
        
        if (!sequenceNo) {
            alert("공정 번호가 지정되지 않았습니다.");
            return;
        }
        
        console.log(sequenceNo);  // 콘솔에 sequenceNo 출력
        loadProcessData(sequenceNo);  // 데이터 로딩 함수 호출
        processNewRegister.show();  // 공정 등록 팝업 표시
    });

	$("#save_button").click(function(event) {
    event.preventDefault();  // 기본 폼 제출 막기

    $.ajax({
        url: "/processcode?action=add",  // 컨트롤러 매핑 URL
        type: "POST",
        data: $("#new_process").serialize(),  // 폼 데이터 직렬화
        success: function(response) {
            alert("저장되었습니다.");
            $("#process_new_register").hide();  // 팝업 숨기기
        },
        error: function(xhr, status, error) {
            alert("저장 실패: " + error);
        }
   		 });
	});

	

    updateCounts();
});



// 각 입력 필드 초기화
function clearInputs() {
    $('.text').val('');
}

// 데이터 로딩과 폼 채우기
function loadProcessData(sequenceNo) {
    $.ajax({
        url: `/alphaknow/processcode/detail?sequenceNo=${sequenceNo}`,
        type: 'POST',
        dataType: 'json',
        success: function(data) {
            $('input[name="sequenceNo"]').val(data.sequenceNo);
            $('input[name="code"]').val(data.code);
            $('input[name="errorCode"]').val(data.errorCode);
            $('input[name="processAbbreviation"]').val(data.processAbbreviation);
            $('input[name="processAlias"]').val(data.processAlias);
            $('input[name="processType"]').val(data.processType);
            $('input[name="standard"]').val(data.standard);
            $('input[name="standardWorkingTime"]').val(data.standardWorkingTime);
            $('input[name="fakeFaultWarning"]').val(data.fakeFaultWarning);
            $('input[name="genuineFaultWarning"]').val(data.genuineFaultWarning);
            $('input[name="repeatable"]').val(data.repeatable);
            
            
            console.log('sequenceNo : ', data.sequenceNo); 
            console.log('code : ', data.code); 
        },
        error: function(xhr, status, error) {
            console.error('Error loading the process data:', error);
            alert("공정 정보를 불러오는 데 실패했습니다.");
        }
    });
}
// "삭제" 버튼 이벤트 처리
function deleteSelectedProcess() {
    var selectedIds = [];
    $('input[name="selectedProcess"]:checked').each(function() {
        selectedIds.push($(this).val());  // 체크된 항목의 값(공정 코드 ID) 수집
    });

    if (selectedIds.length === 0) {
        alert('삭제할 항목을 선택해주세요.');
        return;
    }

    // AJAX 요청으로 서버에 삭제 요청
    $.ajax({
        url: '/processcode?action=delete',  // 삭제 처리 URL
        type: 'POST',
        data: { ids: selectedIds },  // 전송할 데이터
        traditional: true,  // jQuery가 배열을 적절하게 처리하도록 설정
        success: function(response) {
            alert('선택한 항목이 삭제되었습니다.');
            location.reload();  // 성공 시 페이지 새로고침
        },
        error: function() {
            alert('삭제 처리 중 오류가 발생했습니다.');
        }
    });
}

// 프로세스 갯수 업데이트
function updateCounts() {
    let totalST = 0;
    let rows = $("#process_board tbody tr");
    rows.each(function() {
        totalST += parseFloat($(this).find("td").eq(8).text() || 0);
    });
    $("#process_code_count").val(rows.length);
    $("#process_st_count").val(totalST.toFixed(2));
}
