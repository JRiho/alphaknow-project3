<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPage</title>

<%
String contextPath = request.getContextPath();
%>

</head>

<link rel="stylesheet"
	href="<%=contextPath%>/css/equipment_production_performance_chart.css">
<script
	src="<%=contextPath%>/js/equipment_production_performance_chart.js"></script>


<body>

	<%@ include file="../mainheader.jsp"%>
	<div id="content">

		<!-- div id="headerj" 시작 -->
		<div id="headerj">장비별생산실적현황</div>
		<!-- div id="headerj" 끝 -->

		<!-- updiv -->
		<div class="updiv">





			<div id="selbox_div">
				<select name="equipment_name" id="eqname">
					<option value="select">장비명</option>
				</select> <select name="equipment_work_time" id="ewtime">
					<option value="select">가동시간</option>
				</select>
			</div>



		<div id="chartInfo">
			<div id="chart_num"></div>
			<div id="chart_line"></div>

			<div id="bar_month_wrap">
				<div id="bar_container">
					<div class="bar" id="bar1"></div>
					<div class="bar" id="bar2"></div>
					<div class="bar" id="bar3"></div>
					<div class="bar" id="bar4"></div>
					<div class="bar" id="bar5"></div>
					<div class="bar" id="bar6"></div>
					<div class="bar" id="bar7"></div>
					<div class="bar" id="bar8"></div>
					<div class="bar" id="bar9"></div>
					<div class="bar" id="bar10"></div>
					<div class="bar" id="bar11"></div>
					<div class="bar" id="bar12"></div>
				</div>
				<div id="month_container">
					<div class="month" id="month1">1월</div>
					<div class="month" id="month2">2월</div>
					<div class="month" id="month3">3월</div>
					<div class="month" id="month4">4월</div>
					<div class="month" id="month5">5월</div>
					<div class="month" id="month6">6월</div>
					<div class="month" id="month7">7월</div>
					<div class="month" id="month8">8월</div>
					<div class="month" id="month9">9월</div>
					<div class="month" id="month10">10월</div>
					<div class="month" id="month11">11월</div>
					<div class="month" id="month12">12월</div>
				</div>
			</div>
		</div>


	</div>















	<!-- 중앙 구분선 -->
	<div id="center_line"></div>
	<!-- 중앙 구분선 끝 -->









	<!-- downdiv -->
	<div class="downdiv">


		<!-- selbox_div -->
		<div id="selbox_div">
			<select name="pcbMonth" id="pcb_month">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select> <select name="equipment_name" id="eqname">
				<option value="select">장비명</option>
			</select>
		</div>
		<!-- selbox_div 끝 -->

		<!-- week_info_div -->
		<div id="week_info">

			<!-- weeks_div -->
			<div id="weeks">
				<div class="week" id="week1">1주차</div>
				<div class="week" id="week2">2주차</div>
				<div class="week" id="week3">3주차</div>
				<div class="week" id="week4">4주차</div>
				<div class="week" id="week5">5주차</div>
			</div>
			<!-- week_div 끝 -->

			<!-- info_div -->
			<div id="info1">
				<!-- info_table -->
				<table id="info_table">
					<!-- info_table_thead -->
					<thead id="info_table_thead">

					</thead>

					<!-- info_table_tbody -->
					<tbody id="info_table_tbody">

					</tbody>
				</table>
				<!-- info_table 끝 -->
			</div>
			<!-- info_div -->

		</div>
		<!-- week_info_div 끝 -->


	</div>
	<!-- downdiv 끝 -->

	</div>







</body>

</html>