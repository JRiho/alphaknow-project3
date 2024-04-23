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
			<a href="javascript:void(0);" onclick="openPopup()">내 프로필</a>
			<a href="/path/to/settings">설정</a>
			<a href="/path/to/logout">로그아웃</a>
		</div>
	</div>

	<!-- 프로필 넣어야 함 -->
</header>

<style>

</style>