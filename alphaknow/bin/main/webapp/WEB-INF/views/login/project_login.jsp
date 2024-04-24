<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="/alphaknow/resources/css/login.css">
<script src="/alphaknow/resources/js/loginScript.js"></script>
<script>
    window.onload = function() {
        // 서버로부터 받은 오류 메시지를 가져옵니다.
        var errorMessage = "<%=request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>";
        if (errorMessage !== "") {
            // 오류 메시지가 있으면 표시합니다.
            var errorDiv = document.getElementById('login_error');
            errorDiv.textContent = errorMessage;
            errorDiv.style.display = 'block';
        }
    }
</script>
</head>

<body>
	<form action="/alphaknow/login" method="post">
		<div id="mainbox">
			<div class="screen">
				<!-- 로그인 타입 선택; id/qr -->
				<div class="login_type">
					<ul>
						<li><a id="loginType_id" class="active">ID 로그인</a></li>
						<li><a id="loginType_qr" class="inactive">QR 로그인</a></li>
					</ul>
				</div>
				<div id="id_login">
					<!-- 아이디 및 비밀번호 입력 -->
					<div class="login">
						<div>
							<div class="id_container">
								<img src="/alphaknow/resources/img/id_icon.png" ondragstart="return false;"> <input
									type="text" name="userId" placeholder="사원아이디" id="id">
							</div>
							<!-- 로그인 버튼 -->
							<input type="submit" id="login" class="login_but" value="로그인" tabindex="-1">
						</div>
						<div class="pass_container">
							<img src="/alphaknow/resources/img/pass_icon.png" ondragstart="return false;"> <input
								type="password" name="password" placeholder="비밀번호" id="pass">
						</div>
						<div id="login_error" style="color: red; display: none;">
							<!-- 오류 메시지는 여기에 표시됩니다 -->
						</div>
					</div>

					<div class="chkbox">
						<!-- id저장 -->
						<label for="saveId"> <input type="checkbox" id="saveId">
							<i class="circle"></i> <span>ID 저장</span>
						</label>
						<!-- 비밀번호 찾기 -->
						<button type="button" id="findPass" onclick="openPopup()">비밀번호
							찾기</button>
					</div>

					<div id="member"></div>
				</div>

				<div id="qr_login">
					<img src="/alphaknow/resources/img/qrcode.png">
					<p>QR코드를 스캔해주세요.</p>
				</div>

			</div>
		</div>
	</form>
</body>

</html>