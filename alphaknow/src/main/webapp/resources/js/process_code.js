$(document).ready(function() {
    let processNewRegister = $("#process_new_register");

    // 공정 신규 추가 및 닫기 버튼 이벤트
    $("#new_process_button").click(function() {
        processNewRegister.show();
        clearInputs();
    });

	// 닫기 버튼 이벤트
	
    $("#close").click(function() {
        processNewRegister.hide();
        clearInputs();
    });
	
	// 추가 버튼 이벤트
	 $('#add_button').click(function() {
        clearFormData(); // 폼 데이터 초기화
        $('#form_action').val('add'); // 액션을 '추가'로 설정
        $('#process_form').show(); // 팝업 보이기
    });

   
    // 수정 버튼 이벤트 
    $('.edit_button').click(function() {
        let sequenceNo = $('input[name="selectedProcess"]:checked').val();
        
        if (!sequenceNo) {
            alert("공정 번호가 지정되지 않았습니다.");
            return;
        }
        $('#form_action').val('update');
        console.log(sequenceNo);  // 콘솔에 sequenceNo 출력
        loadProcessData(sequenceNo);  // 데이터 로딩 함수 호출
        processNewRegister.show();  // 공정 등록 팝업 표시
    });

	 $('#save_button').click(function(event) {
        event.preventDefault(); // 폼의 기본 제출 방지
		var action = $('#form_action').val(); // 현재 설정된 액션

        let formData = {
        	sequenceNo : $('input[name="sequenceNo"]').val(),
            code: $('input[name="code"]').val(),
            errorCode: $('input[name="errorCode"]').val(),
            processAbbreviation: $('input[name="processAbbreviation"]').val(),
            processAlias: $('input[name="processAlias"]').val(),
            processType: $('input[name="processType"]').val(),
            standard: $('input[name="standard"]').val(),
            standardWorkingTime: $('input[name="standardWorkingTime"]').val(),
            fakeFaultWarning: $('input[name="fakeFaultWarning"]').val(),
            genuineFaultWarning: $('input[name="genuineFaultWarning"]').val(),
            repeatable: $('input[name="repeatable"]').val()
        };

        $.ajax({
		    url: '/alphaknow/processcode/'+ action,  
		    type: 'POST',
		    contentType: 'application/json',
		    data: JSON.stringify(formData),  // formData는 ProcessCodeDTO 클래스의 필드 구조와 일치한지 확인할 것.
		    success: function(response) {
		        alert('저장되었습니다. & 테이블 업데이트!');
		        console.log(action);
		        console.log(formData);
		        // 성공 후 필요한 추가 작업
		        location.reload();
		        processNewRegister.hide();
        		clearInputs();
		    },
		    error: function(xhr, status, error) {
		        alert('저장 실패: ' + xhr.responseText);
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
        selectedIds.push(parseInt($(this).val(), 10));
    });

    if (selectedIds.length === 0) {
        alert('삭제할 공정 코드를 선택하세요.');
        return;
    }

    if (confirm('선택한 공정 코드를 정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '/alphaknow/processcode/deleteProcessCode',  // 실제 서버 URL 경로에 맞게 수정
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(selectedIds),
            success: function(response) {
                alert('성공적으로 삭제되었습니다.');
                location.reload(); // 페이지를 다시 불러옴
            },
            error: function(error) {
                alert('삭제합니다.!!' + error.statusText);
            }
        });
    }
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
