window.addEventListener('load', function () {
      let customer_new_register = document.getElementById("process_new_register");

      document.getElementById("new_process_button").addEventListener("click", function () {
        customer_new_register.style.display = "block"; // pop-up 창을 띄우는 부분
        document.querySelectorAll('.text').forEach(function (input) { input.value = ''; });
      });

      document.getElementById("close").addEventListener("click", function () {
        customer_new_register.style.display = "none"; // pop-up 창을 숨기는 부분
        document.querySelectorAll('.text').forEach(function (input) { input.value = ''; });
      });
      document.getElementById("delete_last_row").addEventListener("click", function () {
        deleteLastRow();
      });

      // 'save' 버튼에 대한 이벤트 리스너를 여기로 이동
      document.getElementById("save").addEventListener("click", function () {
        let table = document.getElementById("process_board").getElementsByTagName('tbody')[0];
        let newRow = table.insertRow(-1); // 새 행 추가

        // 마지막 행의 '순서' 값을 기반으로 새 순서 값을 계산
        let lastRow = table.rows[table.rows.length - 2]; // 마지막 행 바로 위 행 참조 (-1이 마지막 행이므로, -2는 그 전 행)
        let lastOrderCell = lastRow ? lastRow.cells[0].textContent : "0"; // 첫 번째 셀이 '순서'를 포함, 행이 없을 경우 '0'으로 시작
        let newOrder = parseInt(lastOrderCell, 10) + 1; // 순서 값에 1 더하기

        let orderCell = newRow.insertCell(0);
        orderCell.textContent = newOrder.toString();

        // 정보 입력 셀 추가
        addTextCell(newRow, "progress_code");
        addTextCell(newRow, "error_code");
        addTextCell(newRow, "process_nickname1");
        addTextCell(newRow, "process_nickname2");
        addTextCell(newRow, "process_division");
        addTextCell(newRow, "process_standard");
        addTextCell(newRow, "st_code");
        addTextCell(newRow, "bad_code1");
        addTextCell(newRow, "bad_code2");
        addTextCell(newRow, "repeat");

        updateCounts();
        document.querySelectorAll('.text').forEach(function (input) { input.value = ''; });
      });

      updateCounts();

    });

    // 텍스트 셀을 추가하는 함수
    function addTextCell(row, inputId) {
      let cell = row.insertCell(-1);
      let inputValue = document.getElementById(inputId).value;
      cell.textContent = inputValue;
    }

    function deleteLastRow() {
      let table = document.getElementById("process_board").getElementsByTagName('tbody')[0];
      if (table.rows.length > 0) {
        table.deleteRow(-1);
      }
      updateCounts();
    }

    function updateRowCount() {
      let table = document.getElementById("process_board").getElementsByTagName('tbody')[0];
      document.getElementById("process_code_count").value = table.rows.length;
    }

    function updateSTCount() {
      let table = document.getElementById("process_board").getElementsByTagName('tbody')[0]; // 'process_board' 테이블의 tbody를 찾음
      let totalST = 0; // ST 합계 초기화

      // 각 행에 대해 반복
      for (let i = 0; i < table.rows.length; i++) {
        let row = table.rows[i];
        // ST 값과 반복 값을 적절한 셀 인덱스로부터 추출
        let stValue = parseFloat(row.cells[7].textContent || 0); // 예시에서는 8번째 셀에 ST 값이 있다고 가정
        let repeatValue = parseFloat(row.cells[10].textContent || 1); // 예시에서는 11번째 셀에 반복 값이 있다고 가정

        // ST 값이 유효한 숫자인지 확인 (NaN 체크)
        if (!isNaN(stValue) && !isNaN(repeatValue)) {
          totalST += stValue * repeatValue; // 유효한 경우, ST와 반복 값을 곱하여 합계에 추가
        }
      }

      // 결과를 'process_st_count' input 요소에 설정
      document.getElementById("process_st_count").value = totalST.toFixed(2); // 결과를 소수점 두 자리까지 표시
    }

    function updateCounts() {
      updateRowCount();
      updateSTCount();
    }