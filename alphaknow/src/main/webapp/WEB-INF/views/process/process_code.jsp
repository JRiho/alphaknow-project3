<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공정코드관리</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/process_code.css">
  <script src="${pageContext.request.contextPath}/js/process_code.js"></script>
</head>

<body>
  <%@ include file="../mainheader.jsp"%>
    <div id="process_code">
      <div class="top_section">
        <div class="title_select_container">
          <h1>공정코드관리</h1>
          <select>
            <option>선택1</option>
            <option>선택2</option>
          </select>
        </div>
        <div id="process_code_button">
          <button type="button" class="change_button" id="new_process_button">추가</button>
          <button type="button">수정</button>
          <button type="button" id="delete_last_row">삭제</button>
        </div>
      </div>
      <div>
        공정수 :
        <input type="text" id="process_code_count">
        총 ST :
        <input type="text" id="process_st_count">
      </div>
    </div>

    <div id="main_content">
      <table id="process_board">
        <!-- 테이블 너비 조절 -->
        <colgroup>
          <col style="width:4.29%" />
          <col style="width:4.29%" />
          <col style="width:4.29%" />
          <col style="width:15%" />
          <col style="width:15%" />
          <col style="width:30%" />
          <col style="width:4.29%" />
          <col style="width:10%" />
          <col style="width:4.29%" />
          <col style="width:4.29%" />
          <col style="width:4.29%" />
        </colgroup>
        <thead>
          <tr>
            <th>순서</th>
            <th>코드</th>
            <th>에러코드</th>
            <th>공정약칭</th>
            <th>공정별칭</th>
            <th>공정구분</th>
            <th>기준</th>
            <th>ST(표준작업시간)</th>
            <th>가성</th>
            <th>진성</th>
            <th>반복</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <th>1</th>
            <th>A</th>
            <th>AA1</th>
            <th>PCB Loading</th>
            <th>PCB로딩</th>
            <th>부품 운송</th>
            <th></th>
            <th>0.5</th>
            <th></th>
            <th></th>
            <th>1</th>
          </tr>
          <tr>
            <th>2</th>
            <th>B</th>
            <th>BB1</th>
            <th>Solder Printing</th>
            <th>솔더 프린팅</th>
            <th>부품마운팅</th>
            <th></th>
            <th>1</th>
            <th></th>
            <th></th>
            <th>1</th>
          </tr>
          <tr>
            <th>3</th>
            <th>C</th>
            <th></th>
            <th>SPI</th>
            <th>납도포 검사기</th>
            <th>부품마운팅</th>
            <th></th>
            <th>1.5</th>
            <th></th>
            <th></th>
            <th>1</th>
          </tr>
          <tr>
            <th>4</th>
            <th>D</th>
            <th></th>
            <th>Chip Mounter</th>
            <th>칩마운터</th>
            <th>부품마운팅</th>
            <th></th>
            <th>1</th>
            <th></th>
            <th></th>
            <th>1</th>
          </tr>
          <tr>
            <th>5</th>
            <th>E</th>
            <th></th>
            <th>Reflow Soldering</th>
            <th>리플로우납땜</th>
            <th>납땜 및 경화</th>
            <th></th>
            <th>1</th>
            <th></th>
            <th></th>
            <th>1</th>
          </tr>
          <tr>
            <th>6</th>
            <th>F</th>
            <th></th>
            <th>UnLoading</th>
            <th>PCB언로딩</th>
            <th>부품 운송</th>
            <th></th>
            <th>0.5</th>
            <th></th>
            <th></th>
            <th>1</th>
          </tr>
          <tr>
            <th>7</th>
            <th>G</th>
            <th></th>
            <th>AOI</th>
            <th>자동광학검사</th>
            <th>검사 및 마무리</th>
            <th></th>
            <th>2</th>
            <th></th>
            <th></th>
            <th>2</th>
          </tr>
          <tr>
            <th>8</th>
            <th>H</th>
            <th></th>
            <th>작업자 검사</th>
            <th>작업자 검사</th>
            <th>검사 및 마무리</th>
            <th></th>
            <th>1</th>
            <th></th>
            <th></th>
            <th>2</th>
          </tr>
        </tbody>

      </table>

    </div>
    <!-- 공정 신규등록 및 수정 팝업 div -->
    <div id="process_new_register">
      <div id="process_title">공정명 수정(수정)

      </div>
      <div id="pop_title">공정명 수정(수정)</div>
      <!-- 거래처 등록 및 수정 table -->
      <div id="table_wrap">

        <table id="new_process">
          <colgroup>
            <col style="width : 30%" />
            <col style="width : 70%" />
          </colgroup>
          <tr>
            <td>코드</td>
            <td><input type="text" class="text" id="progress_code" placeholder="진행코드"></td>
          </tr>
          <tr>
            <td>에러코드</td>
            <td><input type="text" class="text" id="error_code" placeholder="에러코드"></td>
          </tr>
          <tr>
            <td>공정약칭</td>
            <td><input type="text" class="text" id="process_nickname1" placeholder="공정약칭"></td>
          </tr>
          <tr>
            <td>공정별칭</td>
            <td><input type="text" class="text" id="process_nickname2" placeholder="공정별칭"></td>
          </tr>
          <tr>
            <td>공정구분</td>
            <td><input type="text" class="text" id="process_division" placeholder="공정구분"></td>
          </tr>
          <tr>
            <td>기준공정</td>
            <td><input type="text" class="text" id="process_standard" placeholder="기준공정"></td>
          </tr>
          <tr>
            <td>ST</td>
            <td><input type="text" class="text" id="st_code" placeholder="표준작업시간을 입력"></td>
          </tr>
          <tr>
            <td>가성불량경고</td>
            <td><input type="text" class="text" id="bad_code1"></td>
          </tr>
          <tr>
            <td>진성불량경고</td>
            <td><input type="text" class="text" id="bad_code2"></td>
          </tr>
          <tr>
            <td>반복</td>
            <td><input type="text" class="text" id="repeat"></td>
          </tr>

        </table>
      </div>

      <div id="setting_button">
        <button id="save" class="change_button">저장</button>
        <button id="close" class="button_basic">닫기</button>
      </div>
    </div>
    <script>
      // 팝업 요소 선택
      var dragPopup = document.getElementById("process_new_register");

      // 드래그 시작 시 좌표와 팝업의 원래 위치
      var startX, startY, originalX, originalY;

      // 드래그 시작 함수
      function dragStart(e) {
        // 드래그 시작 위치 설정
        startX = e.clientX;
        startY = e.clientY;

        // 팝업의 원래 위치 가져오기
        originalX = dragPopup.offsetLeft;
        originalY = dragPopup.offsetTop;

        // 이동 이벤트와 종료 이벤트 등록
        document.addEventListener('mousemove', dragMove);
        document.addEventListener('mouseup', dragEnd);
      }

      // 드래그 이동 함수
      function dragMove(e) {
        // 이동한 거리 계산
        var moveX = e.clientX - startX;
        var moveY = e.clientY - startY;

        // 팝업의 새 위치 설정
        dragPopup.style.left = originalX + moveX + 'px';
        dragPopup.style.top = originalY + moveY + 'px';
      }

      // 드래그 종료 함수
      function dragEnd() {
        // 이벤트 리스너 제거
        document.removeEventListener('mousemove', dragMove);
        document.removeEventListener('mouseup', dragEnd);
      }

      // 팝업에 드래그 시작 이벤트 리스너 추가
      dragPopup.addEventListener('mousedown', dragStart);

    </script>
</body>

</html>