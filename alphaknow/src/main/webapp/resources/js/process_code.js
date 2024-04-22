document.addEventListener('DOMContentLoaded', function () {
    let processNewRegister = document.getElementById("process_new_register");

    // 공정 신규 추가 버튼
    document.getElementById("new_process_button").addEventListener("click", function () {
        processNewRegister.style.display = "block";
        clearInputs();
    });

    // 팝업 닫기 버튼
    document.getElementById("close").addEventListener("click", function () {
        processNewRegister.style.display = "none";
        clearInputs();
    });


    // 공정 정보 저장 버튼
    document.getElementById("save").addEventListener("click", saveNewProcess);

    // 각 수정 버튼 이벤트 리스너
   document.querySelectorAll('.edit_button').forEach(button => {
        button.addEventListener('click', function() {
            let sequenceNo = this.getAttribute('data-id');
            loadProcessData(sequenceNo);
            showAddForm();
        });
    });

    updateCounts();
});

document.getElementById("edit_button").addEventListener("click", function() {
    // 선택된 체크박스 확인
    let selectedCheckbox = document.querySelector('input[name="selectedProcess"]:checked');
    if (!selectedCheckbox) {
        alert("공정을 선택해주세요.");
        return;
    }

    let sequenceNo = selectedCheckbox.value;
    fetch(`/processcode?sequenceNo=${sequenceNo}`)
        .then(response => response.json())
        .then(data => {
            // 데이터를 폼에 채우기
            document.querySelector('input[name="code"]').value = data.code;
            document.querySelector('input[name="errorCode"]').value = data.errorCode;
            document.querySelector('input[name="processAbbreviation"]').value = data.processAbbreviation;
            document.querySelector('input[name="processAlias"]').value = data.processAlias;
            document.querySelector('input[name="processType"]').value = data.processType;
            document.querySelector('input[name="standard"]').value = data.standard;
            document.querySelector('input[name="standardWorkingTime"]').value = data.standardWorkingTime;
            document.querySelector('input[name="fakeFaultWarning"]').value = data.fakeFaultWarning;
            document.querySelector('input[name="genuineFaultWarning"]').value = data.genuineFaultWarning;
            document.querySelector('input[name="repeatable"]').value = data.repeatable;
            
            // 팝업 표시
            document.getElementById('process_new_register').style.display = 'block';
        })
        .catch(error => console.error('Error loading the process data:', error));
});


function clearInputs() {
    document.querySelectorAll('.text').forEach(input => input.value = '');
}

function saveNewProcess() {
    let formData = {
        sequenceNo: document.querySelector("#sequenceNo").value, // 확인 후 ID 조정
        code: document.querySelector("#code").value,
        errorCode: document.querySelector("#errorCode").value,
        processAbbreviation: document.querySelector("#processAbbreviation").value,
        processAlias: document.querySelector("#processAlias").value,
        processType: document.querySelector("#processType").value,
        standard: document.querySelector("#standard").value,
        standardWorkingTime: document.querySelector("#standardWorkingTime").value,
        fakeFaultWarning: document.querySelector("#fakeFaultWarning").value,
        genuineFaultWarning: document.querySelector("#genuineFaultWarning").value,
        repeatable: document.querySelector("#repeatable").value
    };

    // AJAX 호출
    fetch("/alphaknow/processcode/insert", {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    }).then(response => response.json())
      .then(data => {
          alert('공정 정보가 저장되었습니다.');
          location.reload(); // 페이지 새로고침
      }).catch(error => {
          console.error("Error saving process:", error);
          alert('공정 정보 저장에 실패했습니다.');
      });
}

function deleteLastRow() {
    let table = document.getElementById("process_board").getElementsByTagName('tbody')[0];
    if (table.rows.length > 0) {
        table.deleteRow(-1);
    }
    updateCounts();
}
function loadProcessData(sequenceNo) {
    // 선택한 공정의 데이터를 서버로부터 가져와서 폼에 세팅
    fetch(`/processcode?sequenceNo=${sequenceNo}`)
        .then(response => response.json())
        .then(data => {
            document.querySelector('input[name="sequenceNo"]').value = data.sequenceNo;
            document.querySelector('input[name="code"]').value = data.code;
            document.querySelector('input[name="errorCode"]').value = data.errorCode;
            document.querySelector('input[name="processAbbreviation"]').value = data.processAbbreviation;
            document.querySelector('input[name="processAlias"]').value = data.processAlias;
            document.querySelector('input[name="processType"]').value = data.processType;
            document.querySelector('input[name="standard"]').value = data.standard;
            document.querySelector('input[name="standardWorkingTime"]').value = data.standardWorkingTime;
            document.querySelector('input[name="fakeFaultWarning"]').value = data.fakeFaultWarning;
            document.querySelector('input[name="genuineFaultWarning"]').value = data.genuineFaultWarning;
            document.querySelector('input[name="repeatable"]').value = data.repeatable;
        })
        .catch(error => console.error('Error loading the process data:', error));
}

function showAddForm() {
    document.getElementById('process_new_register').style.display = 'block';
}

// 폼 제출 핸들러
function updateProcess() {
    let form = document.querySelector('form');
    let formData = new FormData(form);
    fetch('/processcodeUpdate', {
        method: 'POST',
        body: formData
    }).then(response => {
        if (response.ok) {
            alert('공정 정보가 수정되었습니다.');
            location.reload();
        }
    }).catch(error => {
        alert('공정 정보 수정에 실패했습니다.');
        console.error('Error updating the process:', error);
    });
}
function updateCounts() {
    let table = document.getElementById("process_board").getElementsByTagName('tbody')[0];
    document.getElementById("process_code_count").value = table.rows.length;
    let totalST = Array.from(table.rows).reduce((total, row) => {
        let st = parseFloat(row.cells[8].textContent || 0);
        return total + st;
    }, 0);
    document.getElementById("process_st_count").value = totalST.toFixed(2);
}
