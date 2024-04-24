<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="stylesheet" href="/alphaknow/resources/css/production_performance_chart.css">
<script src="/alphaknow/resources/js/production_performance_chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>


	<div id="content">

		<!-- div id="headerj" 시작 -->
		<div id="headerj">생산실적현황</div>
		<!-- div id="headerj" 끝 -->

		<!-- updiv -->
		<div class="updiv">





			<div id="selbox_div">
				<select name="pcbYear" id="pcb_year">
					<option value="2023">2023년</option>
					<option value="2024">2024년</option>
				</select> <select name="pcbType" id="pcb_type">
					<option value="1">pcb명</option>
				</select> <select name="pcbChart" id="pcb_chart">
					<option value="1">계획량 / 실생산량</option>
					<option value="1">달성률 / 불량률</option>
				</select>
				<button type="button">찾기</button>
			</div>


			<div id="chartInfo">
				<canvas id="myChart"></canvas>
			</div>

		</div>
		<!-- updiv 끝 -->















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
	<c:if test="${ list != null }">
		<c:forEach var="list" items="${ list }">
		<div>
			<input type="hidden" value="${ list.workYear }" data-type="workYear" data-month="${ list.workMonth }" data-week="${ list.workWeek }" data-item="${ list.itemName }">
			<input type="hidden" value="${ list.workMonth }" data-type="workMonth">
			<input type="hidden" value="${ list.workWeek }" data-type="workWeek">
			<input type="hidden" value="${ list.workDay }" data-type="workDay">
			<input type="hidden" value="${ list.itemName }" data-type="itemName">
			<input type="hidden" value="${ list.productionAmount }" data-type="productionAmount">
			<input type="hidden" value="${ list.makeAmount }" data-type="makeAmount">
			<input type="hidden" value="${ list.achievementRate }" data-type="achievementRate">
			<input type="hidden" value="${ list.defectRate }" data-type="defectRate">
		</div>
		</c:forEach>
	</c:if>
</body>

</html>