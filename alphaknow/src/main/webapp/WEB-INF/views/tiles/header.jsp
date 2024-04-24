<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/alphaknow/resources/css/tiles/header.css">
<script src="/alphaknow/resources/js/tiles/header.js"></script>
<header>
	<a href="/alphaknow/mainPage">
		<div class="logo">
			<img src="/alphaknow/resources/img/logo.png">
		</div>
	</a>
	<!-- 프로필 이미지에 onclick 이벤트를 추가하여 이미지 클릭 시 toggleDropdown 함수가 호출 -->
	<div class="profile" onclick="toggleDropdown()">
		<img src="/alphaknow/resources/img/mainprofile.png">
		<div id="myDropdown" class="dropdown-content" style="display:none;">
			<!-- 드롭다운 메뉴 아이템들 -->
			<div id="username">
			<% 
                    // 세션에서 사용자 이름 가져오기
                    String userName = (String)session.getAttribute("userName");
					String department = (String)session.getAttribute("department");
                    if(userName != null) {
                        out.println(department+"팀 "+userName+"님<br>"); // 사용자 이름 출력
                    } else {
                        out.print("게스트"); // 세션이 없는 경우 게스트로 표시
                    }
             %>
			</div>
			<a href="javascript:void(0);" onclick="openPopup()">내 프로필</a>
			<a href="/alphaknow/logout">로그아웃</a>
		</div>
	</div>

	<!-- 프로필 넣어야 함 -->
</header>

<style>

</style>