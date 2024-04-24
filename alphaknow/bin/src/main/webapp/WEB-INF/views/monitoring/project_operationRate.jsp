<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MainPage</title>
	<link rel="stylesheet" href="../css/operationRate.css">
	<link rel="stylesheet" href="../css/styles.css">
	<script src="../js/operationRate.js"></script>
	<script src="../js/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

	<%@ include file="../mainheader.jsp"%>

	<div id="content">
		<div id="rate_option">
			<button type="button" id="option_btn1">일간별 가동률현황</button>
			<button type="button" id="option_btn2">주간별 가동률현황</button>
		</div>

		<div id="rate_date">
			<button type="button" id="prevMonth">
				<img src="../img/arrow_icon.png" class="arrow1">
			</button>
			<div id="currentDate"></div>
			<button type="button" id="nextMonth">
				<img src="../img/arrow_icon.png" class="arrow2">
			</button>
		</div>

		<div id="rateTable_day"></div>

		<div id="rateChart_week">
			<canvas id="weeklyChart" width="1150"></canvas>
		</div>
	</div>

</body>

</html>