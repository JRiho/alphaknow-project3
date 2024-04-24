<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/alphaknow/resources/css/group.css">
    <link rel="stylesheet" href="/alphaknow/resources/css/calendar.css">
    <script src="/alphaknow/resources/js/calendar.js"></script>
</head>

<body>
    <div class="side">
        <div class="side_profile">
            <img src="/alphaknow/resources/img/profile_icon.png" class="profile_img">
            <div>
				<font size="5">
					<b>
						<%
							String userName = (String)session.getAttribute("userName");
							if(userName != null) {
		                        out.println(userName); // 사용자 이름 출력
		                    }
						%>
					</b>
				</font>
			</div>
			<div>
				<%
					String department = (String)session.getAttribute("department");
					String jobgrade = (String)session.getAttribute("jobgrade");
					if(department != null && jobgrade != null) {
		            	out.println(department+"팀/"+jobgrade); // 사용자 부서/직급 출력
		            }
				%>
			</div>
			<div>
				<%
					String phone = (String)session.getAttribute("phone");
					if(phone != null) {
		            	out.println(phone); // 사용자 휴대폰번호 출력
		            }
				%>		
			</div>
            <div style="margin-top: 20px"><a href="" class="logout">정보수정</a></div>
        </div>
        
        <div class="vertical_line"></div>

        <div class="side_menu">
            <ul>
                <li><a class="active">일정관리</a></li>
                <li><a class="side_EDSM" href="/alphaknow/myprofile/EDSM">전자결재</a></li>
            </ul>
        </div>
    </div>

    <div class="main">
        <div class="menu">
            <ul>
                <li><a class="calendar">캘린더</a></li>
                <li class="att"><a href="/alphaknow/myprofile/attendance">근태현황</a></li>
            </ul>
        </div>

        <div class="calDate">
            <img src="/alphaknow/resources/img/arrow_icon.png"
            class="arrow1">
            <div class="year_month"></div>
            <img src="/alphaknow/resources/img/arrow_icon.png"
            class="arrow2">
        </div>

        <div class="cal">
            <div class="main">
				<div class="days">
					<div class="day">일</div>
					<div class="day">월</div>
					<div class="day">화</div>
					<div class="day">수</div>
					<div class="day">목</div>
					<div class="day">금</div>
					<div class="day">토</div>
				</div>
				<div class="dates"></div>
			</div>
        </div>

        <div style="text-align: right;">
            <input class="save_but" type="button" value="일정저장">
        </div>
    </div> 
</body>
</html>