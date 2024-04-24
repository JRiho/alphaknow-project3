<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="/alphaknow/resources/css/group.css">
<link rel="stylesheet"
	href="/alphaknow/resources/css/overtime_popup.css">
<link rel="stylesheet" href="/alphaknow/resources/css/attend_popup1.css">
<script src="/alphaknow/resources/js/attendance.js"></script>
</head>
<style>
.menu ul li a.att {
	background: #1abd9c;
	color: #fff;
	border: 0;
	cursor: pointer;
}

.calDate {
	position: relative;
	align-items: center;
	text-align: center;
	margin-top: 10px;
}

.calDate img {
	position: absolute;
}

.year_month {
	font-size: 32px;
	font-weight: bold;
}

.arrow1 {
	max-height: 100%;
	transform: scaleX(-1);
	width: 30px;
	height: 30px;
	left: 37%;
	top: 20%;
	cursor: pointer;
}

.arrow2 {
	max-height: 100%;
	width: 30px;
	height: 30px;
	right: 37%;
	top: 20%;
	cursor: pointer;
}

.but {
	display: inline-block;
	margin-left: 85%;
}

.but button {
	width: 100px;
	height: 30px;
	border: 0;
	background-color: #1abd9c;
	color: white;
	border-radius: 5px;
	cursor: pointer;
}

.but button:hover {
	background-color: #15a084;
}

.stat {
	position: relative;
	width: 94%;
	height: 150px;
	border: 2px solid #b9b9b9;
	margin-left: 30px;
	margin-top: 20px;
	border-radius: 10px;
}

.stat p {
	font-size: 26px;
	color: rgb(26, 188, 156);
}

.stat span {
	margin-top: 25%;
}

.week_accum {
	display: inline-block;
	width: 13%;
	text-align: center;
	margin-top: 3%;
	margin-left: 4%;
}

.week_over {
	display: inline-block;
	width: 13%;
	text-align: center;
	margin-left: 5%;
}

.month {
	display: inline-block;
	width: 13%;
	text-align: center;
	margin-left: 7%;
}

.month p {
	font-size: 26px;
	color: #777;
}

.line1 {
	position: absolute;
	width: 2px;
	height: 67%;
	background-color: #b9b9b9;
	left: 20%;
	bottom: 16%;
}

.line2 {
	position: absolute;
	width: 2px;
	height: 67%;
	background-color: #b9b9b9;
	left: 57%;
	bottom: 16%;
}

.week_stat div {
	position: relative;
	margin-top: 7%;
	margin-left: 30px;
}

.week_stat span {
	font-size: 20px;
}

.week_stat button {
	position: absolute;
	margin-top: 0.3%;
	border: 0;
	background-color: white;
	cursor: pointer;
}

.week_stat p {
	float: right;
	margin: 10px;
	line-height: 0.4;
	font-size: 20px;
}

.week_stat .gray {
	margin-right: 5%;
}
</style>

<body>

	<div class="side">
		<div class="side_profile">
			<img src="/alphaknow/resources/img/profile_icon.png"
				class="profile_img">
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
			<div style="margin-top: 20px">
				<a href="" class="logout">정보수정</a>
			</div>
		</div>

		<div class="vertical_line"></div>

		<div class="side_menu">
			<ul>
				<li><a class="active">일정관리</a></li>
				<li><a class="EDSM" href="/alphaknow/myprofile/EDSM">전자결재</a></li>
			</ul>
		</div>
	</div>

	<div class="main">

		<div class="menu">
			<ul>
				<li><a class="calendar" href="/alphaknow/myprofile/calendar">캘린더</a></li>
				<li><a class="att" href="/alphaknow/myprofile/attendance">근태현황</a></li>
			</ul>
		</div>

		<div class="calDate">
			<img src="/alphaknow/resources/img/arrow_icon.png" class="arrow1">
			<div class="year_month"></div>
			<img src="/alphaknow/resources/img/arrow_icon.png" class="arrow2">
		</div>

		<div style="margin-left: 30px; display: inline-block">
			<font size="4"><b>기본 그룹</b></font> &nbsp;09:00 ~ 18:00
		</div>
		<div class="but">
			<button type="button" id="overtime_application">연장근무신청</button>
		</div>

		<div class="stat">
			<div class="week_accum">
				<span>이번주 누적</span>
				<p>45h 0m</p>
			</div>

			<div class="line1"></div>

			<div class="week_over">
				<span>이번주 초과</span>
				<p>0h 0m</p>
			</div>

			<div class="week_over">
				<span>이번주 잔여</span>
				<p>5h 0m</p>
			</div>

			<div class="line2"></div>

			<div class="month">
				<span>이번달 누적</span>
				<p>45h 0m</p>
			</div>

			<div class="month">
				<span>이번달 연장</span>
				<p>5h 0m</p>
			</div>
		</div>

		<div class="week_stat">
			<div>
				<span>1주차</span>
				<button type="button" id="week1_popup">
					<img src="/alphaknow/resources/img/arrow_icon.png" width="20px"
						height="20px">
				</button>
				<p>
					<font color="#777">초과 근무시간 5h 00m</font>
				</p>
				<p>누적 근무시간 45h 0m</p>
			</div>
			<div>
				<span>2주차</span>
				<button type="button" class="week2_popup">
					<img src="/alphaknow/resources/img/arrow_icon.png" width="20px"
						height="20px">
				</button>
				<p>
					<font color="#777">초과 근무시간 0h 0m</font>
				</p>
				<p>누적 근무시간 0h 0m</p>
			</div>
			<div>
				<span>3주차</span>
				<button type="button" class="week2_popup">
					<img src="/alphaknow/resources/img/arrow_icon.png" width="20px"
						height="20px">
				</button>
				<p>
					<font color="#777">초과 근무시간 0h 0m</font>
				</p>
				<p>누적 근무시간 0h 0m</p>
			</div>
			<div>
				<span>4주차</span>
				<button type="button" class="week2_popup">
					<img src="/alphaknow/resources/img/arrow_icon.png" width="20px"
						height="20px">
				</button>
				<p>
					<font color="#777">초과 근무시간 0h 0m</font>
				</p>
				<p>누적 근무시간 0h 0m</p>
			</div>
			<div>
				<span>5주차</span>
				<button type="button" class="week2_popup">
					<img src="/alphaknow/resources/img/arrow_icon.png" width="20px"
						height="20px">
				</button>
				<p>
					<font color="#777">초과 근무시간 0h 0m</font>
				</p>
				<p>누적 근무시간 0h 0m</p>
			</div>
		</div>

	</div>

	<div id="overtime_app">
		<div id="head">
			<h2 style="position: relative;">연장근무신청서</h2>

			<div>
				<button type="button" class="close">
					<img src="/alphaknow/resources/img/close_icon.png"
						style="width: 50px; height: 50px;">
				</button>
			</div>
		</div>

		<div>
			<table class="table1" border="1px solid">
				<tr>
					<th>기안자</th>
					<td width="70%"><input type="text" id="overtime_name">
					</td>
				</tr>
				<tr>
					<th>기안부서</th>
					<td><input type="text" id="overtime_dept"></td>
				</tr>
				<tr>
					<th>기안일</th>
					<td><input type="text" id="overtime_date"></td>
				</tr>
				<tr>
					<th>문서번호</th>
					<td><input type="text" id="overtime_doc"></td>
				</tr>
			</table>
		</div>

		<div class="top">
			<table class="table2" border="1px solid">
				<tr>
					<th rowspan="3" width="30px">승인</th>
					<td></td>
					<td></td>
				</tr>
				<tr height="60%">
					<td width="42%">김팀장</td>
					<td>관리자</td>
				</tr>
				<tr height="20%">
					<td></td>
					<td></td>
				</tr>
			</table>

			<table class="table3" border="1px solid">
				<tr>
					<th rowspan="3" width="30px">신청</th>
					<td></td>
				</tr>
				<tr height="60%">
					<td><img src="/alphaknow/resources/img/approved_icon.png"
						style="width: 80px; height: 70px;"></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>

		<div>
			<table class="table4" border="1px solid">
				<tr>
					<td colspan="5">신청 내역</td>
				</tr>
				<tr>
					<th width="12%">근무구분</th>
					<th width="12%">근무일시</th>
					<th width="26%">근무시간</th>
					<th colspan="2">작업내용</th>
				</tr>
				<tr height="40%">
					<td><textarea class="text1"></textarea></td>
					<td><textarea class="text1"></textarea></td>
					<td><textarea class="text2"></textarea></td>
					<td colspan="2"><textarea class="text3"></textarea></td>
				</tr>
				<tr>
					<th>주 근무시간</th>
					<th colspan="2">0h 0m 0s(초과: 0h 0m 0s)</th>
					<th>월 근무시간</th>
					<th>0h 0m 0s(초과: 0h 0m 0s)</th>
				</tr>
			</table>
		</div>

		<div>
			<table class="table5" border="1px solid">
				<tr>
					<td colspan="4">이전 승인요청 내역</td>
				</tr>
				<tr>
					<th width="12%">상태</th>
					<th width="12%">근무구분</th>
					<th width="12%">근무일시</th>
					<th>작업내용</th>
				</tr>
			</table>
		</div>

		<div>
			<button type="button" id="save">신청하기</button>
		</div>
	</div>

	<div id="attend_popup_1">
		<h2>1주차</h2>

		<div>
			<button type="button" class="close">
				<img src="/alphaknow/resources/img/close_icon.png"
					style="width: 40px; height: 40px;">
			</button>
		</div>

		<div>
			<table class="attend_day">
				<tr height="20%">
					<th class="bor" style="color: red;">일</th>
					<th class="bor">월</th>
					<th class="bor">화</th>
					<th class="bor">수</th>
					<th class="bor">목</th>
					<th class="bor">금</th>
					<th style="color: blue;">토</th>
				</tr>

				<tr>
					<td class="bor">0h 0m <br> 연장: 0h 0m
					</td>
					<td class="bor">9h 0m <br> 기본: 8h 0m <br> 연장: 1h 0m
						<br> 야간: 0h 0m <br>
					</td>
					<td class="bor">10h 0m <br> 기본: 8h 0m <br> 연장: 2h 0m
						<br> 야간: 0h 0m <br>
					</td>
					<td class="bor">8h 0m <br> 기본: 8h 0m <br> 연장: 0h 0m
						<br> 야간: 0h 0m <br>
					</td>
					<td class="bor">10h 0m <br> 기본: 8h 0m <br> 연장: 2h 0m
						<br> 야간: 0h 0m <br>
					</td>
					<td class="bor">8h 0m <br> 기본: 8h 0m <br> 연장: 0h 0m
						<br> 야간: 0h 0m <br>
					</td>
					<td>0h 0m <br> 기본: 0h 0m <br> 연장: 0h 0m <br>
						야간: 0h 0m <br>
					</td>
				</tr>
			</table>
		</div>
	</div>

</body>

</html>