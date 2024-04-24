<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPage</title>
<link rel="stylesheet" href="../css/downtimeRate.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<script>
//////////////////////////////
//content 영역 자바스크립트 //
/////////////////////////////

document.addEventListener('DOMContentLoaded', function () {
 const toggleButtons = document.querySelectorAll('.toggleButton');
 const downtimePie = document.getElementById('downtime_pie');
 const operationStats = document.getElementById('operationStats');
 const ctx = downtimePie.getContext('2d');
 let currentData = [0, 0]; 

 // 각 버튼을 클릭할 때마다 해당 기기의 가동률과 비가동률을 랜덤으로 설정하고 파이 차트를 업데이트
 toggleButtons.forEach(function (button, index) {
     button.addEventListener('click', function () {
         // 랜덤 가동률 생성
         const operatingRate = (Math.random() * 1.9 + 98).toFixed(1);
         const downtimeRate = 100 - operatingRate;

         // 현재 선택된 기기의 가동률 데이터를 업데이트
         currentData = [operatingRate, downtimeRate];
         updatePieChart(currentData, button.dataset.target);
         updateOperationStats(operatingRate, downtimeRate);
     });
 });

 // 초기 파이 차트 생성 (PCB 로더의 가동률로 설정)
 const initialOperatingRate = (Math.random() * 1.9 + 98).toFixed(1);
 const initialDowntimeRate = 100 - initialOperatingRate;
 currentData = [initialOperatingRate, initialDowntimeRate];
 updatePieChart(currentData, 'PCB 로더');
 updateOperationStats(initialOperatingRate, initialDowntimeRate);

 // 파이 차트 업데이트 함수
 function updatePieChart(data, deviceName) {
     if (window.myPieChart) {
         window.myPieChart.destroy();
     }

     // 파이 차트 데이터 생성
     const chartData = {
         labels: ['가동률', '비가동률'],
         datasets: [{
             label: '비가동률',
             data: data,
             backgroundColor: [
                 'rgba(30, 212, 176, 0.7)',
                 'rgba(231, 56, 50, 0.7)'
             ],
             borderColor: [
                 'rgba(26, 188, 156, 1)',
                 'rgba(255, 8, 0, 1)'
             ],
             borderWidth: 1
         }]
     };

     // 파이 차트 설정
     const config = {
         type: 'pie',
         data: chartData,
         options: {
             responsive: false,
             plugins: {
                 legend: {
                     position: 'top',
                 },
                 title: {
                     display: true,
                     text: deviceName,
                     font: {
                         size: 20
                     }
                 }
             }
         }
     };

     // 파이 차트 생성
     window.myPieChart = new Chart(ctx, config);
 }

 function updateOperationStats(operatingRate, downtimeRate) {
     operationStats.querySelector('#operatingRate').textContent = `${operatingRate}%`;
     operationStats.querySelector('#downtimeRate').textContent = `${downtimeRate.toFixed(1)}%`;
 }

 // 현재 시간을 기준으로 총 작동시간 업데이트 함수
 function updateTotalOperationTime() {
     const now = new Date();
     const startTime = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 9, 0, 0); // 오전 9시
     const millsec = now - startTime;
     const totalOperationHours = Math.floor(millsec / (1000 * 60 * 60)); // 시간 단위
     const totalOperationMins = Math.floor((millsec % (1000 * 60 * 60)) / (1000 * 60)); // 분 단위
     operationStats.querySelector('#totalOperationTime').textContent = 
     `${totalOperationHours}시간 ${totalOperationMins}분`;
 }

 // 페이지가 로드될 때
 updateTotalOperationTime();
 setInterval(updateTotalOperationTime, 10 * 60 * 1000); // 10분마다 업데이트

});

</script>

<body>

	<div id="content">
		<div id="downtime_menu"></div>

		<div id="equip_downtime">

			<div id="downtime_chart">
				<canvas id="downtime_pie" width="220" height="250"></canvas>
			</div>

		</div>
	</div>

</body>

</html>