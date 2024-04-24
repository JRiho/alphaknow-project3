<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 찾기</title>
</head>

<style>
  body {
    font-size: 13px;
  }

  #findPass_table p {
    font-size: 20px;
    font-weight: bold;
  }

  table {
    border: 1px solid #ccc;
    border-collapse: collapse;
    width: 800px;
    height: 111px;
  }

  tr,
  td {
    border: 1px solid #ccc;
  }

  #findPass_table th {
    background-color: #eee;
    font-weight: 400;
  }

  td {
    text-align: center;
  }

  input[type="text"] {
    width: 98%;
    height: 70%;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
  }

  input[type="text"]:hover {
    border-color: #89bcff;
  }

  input[type="text"]:focus {
    border: 1px solid #006eff;
  }

  #findPass_info {
    width: 800px;
    height: 150px;
    border: 1px solid #ccc;
    border-radius: 10px;
    margin-top: 10px;
  }

  #findPass_info p {
    margin: 10px;
  }

  .p {
    text-indent: 20px;
  }

  a {
    text-decoration: none;
    color: #006eff;
  }

  #findPass_btn {
    margin-top: 15px;
  }

  #findPass_submit {
    border: 0;
    background-color: #1abc9c;
    width: 55px;
    height: 30px;
    border-radius: 5px;
    color: white;
    cursor: pointer;
  }

  #findPass_submit:hover {
    background-color: #15a084;
  }

  #findPass_close {
    border: 1px solid #ccc;
    background-color: white;
    width: 55px;
    height: 30px;
    border-radius: 5px;
    cursor: pointer;
  }

  #findPass_close:hover {
    border: 1px solid #aaa;
  }
</style>

<script>
  function closePopup() {
    window.close();
  };
</script>

<body>

  <div id="findPass_popup">

    <div id="findPass_table">
      <p>비밀번호 찾기</p>
      <table>
        <tr>
          <th width="20%">성명</th>
          <td>
            <input type="text">
          </td>
        </tr>
        <tr>
          <th>복구 방법</th>
          <td style="text-align: left;">
            <input type="radio" name="방법" checked>복구 Email로 비밀번호 찾기
            <input type="radio" name="방법">SMS로 비밀번호 찾기
          </td>
        </tr>
        <tr>
          <th>복구 Email</th>
          <td>
            <input type="text">
          </td>
        </tr>
      </table>
    </div>

    <div id="findPass_info">
      <p>▶입력한 성명과 ID에 등록되어 있는 복구Email이 일치할 경우, [로그인 정보 안내 메일]이 발송됩니다.</p>
      <p class="p">- 비밀번호를 변경한 이력은 귀사의 자료권리자와 마스터ID에게 전송됩니다.</p>
      <p class="p">- 입력한 Email에서 메일이 확인되지 않을 경우, 스팸 메일함을 확인해주시기 바랍니다.</p>
      <p class="p">- 복구 Email 주소가 기억나지 않는 경우, 마스터ID 사용자에게 문의 바랍니다.</p>
      <p class="p"><a href="">* 마스터ID 사용자인데 복구 Email 주소가 기억나지 않는 경우</a></p>
    </div>

    <div id="findPass_btn">
      <button type="button" id="findPass_submit">발송</button>
      <button type="button" id="findPass_close" onclick="closePopup()">닫기</button>
    </div>

  </div>

</body>

</html>