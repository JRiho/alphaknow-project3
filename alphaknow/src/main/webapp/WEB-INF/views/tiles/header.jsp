<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/alphaknow/resources/css/tiles/header.css">

<script>
function openPopup() {
    window.open('/alphaknow/group/project_calendar.jsp', '프로필', 'width=950, height=750');
}
</script>
	
<header>
	<a href="/alphaknow/mainPage">
		<div class="logo">
			<img src="/alphaknow/resources/img/logo.png">
		</div>
	</a>
	<div class="profile">
		<a onclick="openPopup()"><img src="/alphaknow/resources/img/mainprofile.png"></a>
	</div>
	<!-- 프로필 넣어야 함 -->
</header>